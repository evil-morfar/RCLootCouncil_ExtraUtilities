local function combineTables(tables)
   local ret = {}
   print("Combining "..#tables.." tables")
   for _, table in pairs(tables) do
      for _, table in pairs(table) do
      for boss, classes in pairs(table) do
         for class, specs in pairs(classes) do
            ret[class] = ret[class] or {}
            for spec, ilvls in pairs(specs) do
               ret[class][spec] = ret[class][spec] or {}
               for ilvl, dat in pairs(ilvls) do
                  ret[class][spec][boss] = ret[class][spec][boss] or {}
                  ret[class][spec][boss][ilvl] = ret[class][spec][boss][ilvl] or {}
                  ret[class][spec][boss][ilvl] = dat
               end
            end
         end
      end
      end
   end
   print "Done"
   return ret
end

local function dirLookup(dir)
   local p = io.popen('dir "'..dir..'" /b ')  --Open directory look for files, save data in p. By giving '-type f' as parameter, it returns all files.
   return p:lines()
end

local function getFiles(dir, type)
   local tables = {}
   local names = dirLookup(dir.."/"..type.."/")
   for name in names do
      table.insert(tables, dofile(dir.."/"..type.."/"..name))
   end
   print("Found", #tables, type.." files")
   return tables
end

local function getDpsFiles(dir)
   return getFiles(dir, "DPS")
end
local function getHpsFiles(dir)
   return getFiles(dir, "Healers")
end
local function getTankFiles(dir)
   return getFiles(dir, "Tanks")
end

return function(dir)
   --local dir = "./output/Antorus_Heroic"
   local fileName = "temp_export.lua"
   dofile("./util/SaveTable.lua")
   print ("Building lua table for",dir)
   persistence.store(fileName,combineTables{getDpsFiles(dir), getHpsFiles(dir), getTankFiles(dir)})
   print("Created lua table in:", fileName)
   print ""
end
