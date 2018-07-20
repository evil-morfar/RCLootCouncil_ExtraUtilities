local fit = require "util/SimpleFit"

local parsesCutoff = 30 -- Minimum number of parses that must exist before the data is used
local debug = false -- Extra spammy console outputs

local specNameToID = {
   DEATHKNIGHT = {
      Blood = 250,
      Frost = 251,
      Unholy = 252,
   },
   DEMONHUNTER = {
      Havoc = 577,
      Vengeance = 581,
   },
   DRUID = {
      Balance = 102,
      Feral = 103,
      Guardian = 104,
      Restoration = 105,
   },
   HUNTER = {
      BeastMastery = 253,
      Marksmanship = 254,
      Survival = 255,
   },
   MAGE = {
      Arcane = 62,
      Fire = 63,
      Frost = 64,
   },
   MONK = {
      Brewmaster = 268,
      Windwalker = 269,
      Mistweaver = 270,
   },
   PALADIN = {
      Holy = 65,
      Protection = 66,
      Retribution = 70,
   },
   PRIEST = {
      Discipline = 256,
      Holy = 257,
      Shadow = 258,
   },
   ROGUE = {
      Assassination = 259,
      Outlaw = 260,
      Subtlety = 261,
   },
   SHAMAN = {
      Elemental = 262,
      Enhancement = 263,
      Restoration = 264,
   },
   WARLOCK = {
      Affliction = 265,
      Demonology = 266,
      Destruction = 267,
   },
   WARRIOR = {
      Arms = 71,
      Fury = 72,
      Protection = 73,
   },
}

local errors = {}

local function saveData(file,data,level)
   if not data then return end
   level = level or 1
   local indent = string.rep("\t", level)
   if type(data) ~= "table" then file:write(data.."\n") end
   for k,v in pairs(data) do repeat
      if type(v) ~= "table" then
         file:write(indent .. "["..(type(k) == "number" and tostring(k) or "\""..k.."\"") .."] = "
         .. tostring(v) .."\n")
         break
      end
      file:write(indent .. "["..(type(k) == "string" and "\""..k.."\"" or tostring(k)) .. "] = {\n")
      saveData(file,v, level + 1)
      file:write(indent .. "},\n")
   until true end
   if level == 1 then
      file:write("}")
   end
end

local function generateFormulas(import)
   print "Generating formulas ..."
   local a,b
   local output = {}
   for class, specs in pairs(import) do
      for spec, bosses in pairs(specs) do
         for boss,ilvls in pairs(bosses) do
            local x,y = {},{}
            for ilvl,dat in pairs(ilvls) do
               if dat[2] < parsesCutoff then
                  if debug then print("Discarding:",class,spec,boss,ilvl,"too few parses:",dat[2]) end
               else
                  table.insert(x,ilvl)
                  table.insert(y,dat[1])
               end
            end
            output[boss] = output[boss] or {}
            output[boss][class] = output[boss][class] or {}
			if #x > 0 then -- In case nothings over the threshold
				b,a = fit.linear(x,y)
			else
				b,a = 0,0
				print("Warning",class,spec,boss, "did not contain any parses above the threshold!")
				table.insert(errors, "WARNING: "..class .. ", ".. spec ..", "..boss.." did not contain any parses above the threshold!")
			end
            if not specNameToID[class][spec] then print("No spec for ", class, spec) end
            output[boss][class][specNameToID[class][spec]] = {a = a, b = b}
         end
      end
   end
   return output
end

local function getFunctionString(a,b)
   local ret = {   -- Each element is a line of text
      "function(dps, ilvl)",
      "\t\t\t\treturn 100 * dps / ("..a.." * ilvl + "..b..")",
      "\t\t\tend,"
   }
   return table.concat(ret, "\n")
end

local function generateFunctions(input)
   print "Generating functions ..."
   for boss, classes in pairs(input) do
      for class, specs in pairs(classes) do
         for spec,dat in pairs(specs) do
            input[boss][class][spec] = getFunctionString(dat.a, dat.b)
         end
      end
   end
end

return function(d)
   local export = "../../RCScore_Functions.lua"
   debug = d
   local import = dofile("temp_export.lua")
   local data = generateFormulas(import)
   generateFunctions(data)

   file = io.open(export, "w+")
   file:write("-- Contains the functions used to calculate RCScore\n")
   file:write("-- Auto generated with data from WarcraftLogs.com\n")
   file:write("-- Updated on "..os.date().." by Potdisc\n\n")
   file:write("_G.ExtraUtilities_RCScore_Functions = {\n")
   saveData(file, data)
   file:close()

   dofile(export)
   local data = ExtraUtilities_RCScore_Functions
   -- Test
   print "Performing tests..."
   local avg,count,res,hi,lo = {},{},0,{ilvl,num},{ilvl,num}
   for class,specs in pairs(import) do
      for spec, bosses in pairs(specs) do
         for boss,ilvls in pairs(bosses) do
            for ilvl,dat in pairs(ilvls) do
               if dat[2] >= parsesCutoff then
                  if not lo[class.."-"..spec] then lo[class.."-"..spec] = {ilvl = 0, num = 100} end
                  if not hi[class.."-"..spec] then hi[class.."-"..spec] = {ilvl = 0, num = 0} end
                  res = data[boss][class][specNameToID[class][spec]](dat[1],ilvl)
                  avg[class.."-"..spec] = (avg[class.."-"..spec] or 0) + res
                  count[class.."-"..spec] = (count[class.."-"..spec] or 0) + 1
                  if hi[class.."-"..spec].num < res then
                     hi[class.."-"..spec].num = res
                     hi[class.."-"..spec].ilvl = ilvl.." "..dat[2]
                  end
                  if lo[class.."-"..spec].num > res then
                     lo[class.."-"..spec].num = res
                     lo[class.."-"..spec].ilvl = ilvl .." "..dat[2]
                  end
                  if debug then print(class, spec, ilvl, res, "%") end
               end
            end
         end
      end
   end
   -- Per class/spec tests
   if debug then
      for spec, v in pairs(avg) do
         print(spec,"Tests:",count[spec])
         print("Average = ",v/count[spec],"%")
         print("Hi/Lo:", hi[spec].ilvl,hi[spec].num, "/", lo[spec].ilvl,lo[spec].num)
         print("Error:",v/count[spec]-100,"%\n")

      end
	  print "\nErrors:"
	for k,v in ipairs(errors) do
		print(k,v)
	end
	print ""
   end	
	
   -- Create a count/average of all class/specs
   local count1, avg1 = 0,0
   for spec in pairs(count) do
      count1 = count1 + count[spec]
      avg1 = avg1 + avg[spec]
   end
   -- And use those for some statistics
   print("\nTests performed:",count1)
   print("Average = ", avg1/count1, "%")
   print("Error:",avg1/count1-100, "%\n")

   print("GenerateFunctions done\n")
end
