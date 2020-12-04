--- Cache.lua Caches data.
-- @author Potdisc
-- Create Date: 04/12/2020

local addon = LibStub("AceAddon-3.0"):GetAddon("RCLootCouncil")
---@class Data.Cache
local Cache = addon.Init "Data.Cache"

local DEFAULT_CACHE_TIME = 3600 -- 1 hour

local cache_class = {
   __index = {
      ---@type table
      cache = {},

      --- Fetches stored value in cache if a) it exists, and b) is within the cache time.
      ---@param self Cache
      ---@param key any @The lookup key.
      ---@return any|nil @Returns the value stored if found, and otherwise nil.
      Get = function(self, key)
         if not self:Contains(key) then return nil end
         if self.cache[key].cache_time + self.cache_time < time() then
            self.cache[key] = nil
            return
         end
         return self.cache[key].value
      end,

      --- Stores the value in the cache with the key 'key'
      ---@param key any @The key to store the data with.
      ---@param value any @The value to store
      Set = function (self, key, value)
         self.cache[key] = {
            value = value,
            cache_time = time()
         }
      end,
      --- Checks if the cache contains the key.
      Contains = function(self, key)
         return self.cache[key] ~= nil
      end
   }
}

--- Creates a new Cache object.
---@param cachetime number @The number of seconds the data should be cached.
---@return Cache
function Cache:GetNewCache (cachetime)
   cachetime = cachetime or DEFAULT_CACHE_TIME
   ---@class Cache
   local obj = setmetatable({ cache = {}, cache_time = cachetime}, cache_class)
   return obj
end
