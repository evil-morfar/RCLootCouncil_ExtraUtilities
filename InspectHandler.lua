local addon = LibStub("AceAddon-3.0"):GetAddon("RCLootCouncil")
local module = addon:GetModule("RCExtraUtilities")

module.InspectHandler = {}

local callback -- The callback function
local pool = {} -- Inspect pool
local isInspecting = false
local inspectIndex = 1
local cache = {}

--[[ Supported inspects:
      gear     Returns a table containing itemlinks of the player's gear
      spec     Returns the specID
]]

-- Local functions:
local function FireCallback(data, unit, get)
   if not (unit and get) then
      unit, get = pool[inspectIndex].unit, pool[inspectIndex].type
   end
   if type(callback) == "function" then
      callback(unit, get, data)
   else
      module[callback](module, unit, get, data)
   end
   return true
end

local function PoolNextInspect()
   -- Stop inspecting
   ClearInspectPlayer()
   -- Setup the next inspect, if any
   tremove(pool, inspectIndex)
   inspectIndex = #pool
   if inspectIndex > 0 then -- We have more
      NotifyInspect(pool[inspectIndex].unit)
   else
      isInspecting = false
   end
end

local function AddToCache(unit, type, data)
   if not cache[unit] then cache[unit] = {} end
   cache[unit][type] = data
end

local function CheckCache(unit, type)
   if cache[unit] then
      return cache[unit][type]
   end
end

--- Sets the callback function
-- Acts like the init for the InspectHandler
-- func is called whenever the inspect data is available - can be either funcref or a method of the module
-- The callback is called with args: unit, type, data
function module.InspectHandler:SetCallback(func)
   if not func or (type(func) ~= "function" and type(func) ~= "string") then error("InspectHandler:SetCallback(func): func wasn't a function reference.") end
   module:RegisterEvent("INSPECT_READY", module.InspectHandler.INSPECT_READY)
   callback = func
end

--- Queues an inspect
-- The provided callback function (@see InspectHandler:SetCallback()) is called once the data is available
-- @param unit The unitid to inspect. Function will just return false if invalid
-- @param inspectType The type of the requested inspect. See top of file for supported types
-- @return True if the inspect was pooled i.e. it's currently possible, otherwise false.
function module.InspectHandler:InspectUnit(unit, inspectType)
   if not callback then error("InspectHandler:InspectUnit(unit,inspectType): Callback not set.") end
   if not unit or type(unit) ~= "string" then error("InspectHandler:InspectUnit(unit,inspectType): unit is invalid.") end
   inspectType = inspectType and inspectType or "spec" -- default to spec

   unit = Ambiguate(unit, "none")
   addon:Debug("Inspect!", unit, CanInspect(unit), CheckInteractDistance(unit, 1))
   if CanInspect(unit) and CheckInteractDistance(unit, 1) then
      if inspectType == "gear" then
         -- REVIEW: Should we verify the gear is actually here?
         tinsert(pool, {unit = unit, type = inspectType})
         inspectIndex = #poll
         local check = CheckCache(unit, "gear")
         if check then return FireCallback(check, unit, "gear") end
         -- Should be able to pull it immediately
         local data = {}
         for i = 1, 17 do
            if i ~= 4 then -- skip the shirt
               local link = GetInventoryItemLink(unit, i)
               tinsert(data, link)
            end
         end
         AddToCache(unit, "gear", data)
         FireCallback(data)
         PoolNextInspect() -- Somewhat of a hack, but should work

      elseif inspectType == "spec" then
         -- Should be available after "INSPECT_READY" event
         tinsert(pool, {unit = unit, type = inspectType})
         local check = CheckCache(unit, "spec")
         if check then return FireCallback(check, unit, "spec") end
         if not isInspecting then -- Only inspect one unit at a time
            isInspecting = true
            inspectIndex = #pool
            NotifyInspect(unit)
         end
      else
         return error("InspectHandler:InspectUnit(unit,type): type ("..tostring(inspectType)..") isn't handled (yet).")
      end
      return true
   end
   return false -- We can't inspect unit right now
end

function module.InspectHandler.INSPECT_READY(...)
   if isInspecting then
      addon:Debug("InspectHandler()", ...)

      if pool[inspectIndex].type == "spec" then
         local spec = GetInspectSpecialization(pool[inspectIndex].unit)
         AddToCache(pool[inspectIndex].unit, "spec", spec)
         FireCallback(spec) -- It's not our problem if we received nil
         PoolNextInspect()

      else
         -- We're trying to inspect something we're not handling
         isInspecting = false
         error("InspectHandler: Trying to handle non handled event for type "..pool[inspectIndex].type)
      end
   end
end
