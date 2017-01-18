-- Author      : Potdisc
-- Create Date : 10/11/2016
-- CustomModule
-- votingUtils.lua	Adds extra columns for the default voting frame

--[[
   NOTE: This is made for the Better-VotingFrame branch

   Pawn integration
   ----------------
   Noteable functions:
      PawnGetItemValue()
         -- PawnUICurrentScale (global) should be useable as a scale
      PawnGetAllItemValues()
]]

local addon = LibStub("AceAddon-3.0"):GetAddon("RCLootCouncil")
local EU = addon:NewModule("RCExtraUtilities", "AceComm-3.0", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("RCLootCouncil")
local LE = LibStub("AceLocale-3.0"):GetLocale("RCExtraUtilities")
local ItemUpgradeInfo = LibStub("LibItemUpgradeInfo-1.0")

local playerData = {} -- Table containing all EU data received, format playerData["playerName"] = {...}

function EU:OnInitialize()
   self:RegisterComm("RCLootCouncil")
   self.version = GetAddOnMetadata("RCLootCouncil_ExtraUtilities", "Version")

   local defaults = {
      profile = {
         columns = {
            traits =          { enabled = true, pos = 10, width = 40, func = self.SetCellTraits,   name = LE["Traits"]},
            upgrades =        { enabled = true, pos = -3, width = 55, func = self.SetCellUpgrades, name = LE["Upgrades"]},
            pawn =            { enabled = false, pos = 11, width = 40, func = self.SetCellPawn,     name = "Pawn"},
            sockets =         { enabled = true, pos = 11, width = 45, func = self.SetCellSocket,   name = LE["Sockets"]},
         -- setPieces =       { enabled = true, pos = 11, width = 40, func = self.SetCellPieces,   name = LE["Set Pieces"]},
            titanforged =     { enabled = true, pos = 10, width = 40, func = self.SetCellForged,   name = LE["Forged"]},
            legendaries =     { enabled = true, pos = 11, width = 55, func = self.SetCellLegend,   name = LE["Legendaries"]},
            ilvlUpgrade =     { enabled = true, pos = -4, width = 50, func = self.SetCellIlvlUpg,  name = LE["ilvl Upg."]},
         },
         normalColumns = {
            class =  { enabled = true, name = LE.Class},
            rank =   { enabled = true, name = L.Rank},
            role =   { enabled = true, name = L.Role},
            ilvl =   { enabled = true, name = L.ilvl},
            diff =   { enabled = true, name = L.Diff},
            roll =   { enabled = true, name = L.Roll},
         }
      }
   }

   addon.db:RegisterNamespace("ExtraUtilities", defaults)
   self.db = addon.db:GetNamespace("ExtraUtilities").profile
   self:OptionsTable()
   self:Enable()
end

function EU:OnEnable()
   addon:DebugLog("Using ExtraUtilities", self.version)
   -- Get the voting frame
   self.votingFrame = addon:GetActiveModule("votingframe")
   -- Crap a copy of the cols
   self.originalCols = {}
   for k,v in pairs(self.votingFrame.scrollCols) do
      self.originalCols[k] = v
   end

   -- Setup our columns
   for colName, v in pairs(self.db.columns) do
      if v.enabled then self:UpdateColumn(colName, true) end
   end
   for colName, v in pairs(self.db.normalColumns) do
      if not v.enabled then self:UpdateColumn(colName, false) end
   end
end

function EU:OnDisable()
   -- Reset cols
   self.votingFrame.scrollCols = self.originalCols
   self:UnregisterAllComm()
end

function EU:OnCommReceived(prefix, serializedMsg, distri, sender)
   if prefix == "RCLootCouncil" then
      -- data is always a table to be unpacked
		local test, command, data = addon:Deserialize(serializedMsg)
		if addon:HandleXRealmComms(self, command, data, sender) then return end

		if test then
         if command == "lootTable" then
            -- We received the lootTable, so send out required info
            addon:SendCommand("group", "extraUtilData", addon.playerName, self:BuildData())

         elseif command == "extraUtilData" then
            -- We received our EU data
            local name, data = unpack(data)
            playerData[name] = data
         end
      end
   end
end

function EU:UpdateColumn(name, bool)
   addon:Debug("UpdateColumn", name, bool)
   local col = self.db.columns[name]
   if not col then -- It's one of the default RC columns
      -- find its' data
      for k,v in pairs(self.originalCols) do
         if v.colName == name then
            -- We got it!
            col = v
            col.pos = k
         end
      end
   end
   if bool then
      local pos = 0
      if col.pos < 0 then
         pos = #self.votingFrame.scrollCols + col.pos -- col.pos is negative, so add it for the desired effect
      elseif col.pos > #self.votingFrame.scrollCols then
         pos = #self.votingFrame.scrollCols
      else
         pos = col.pos
      end
      addon:Debug("Putting", name, "at", pos)
      tinsert(self.votingFrame.scrollCols, pos,
         {name = col.name, align = "CENTER", width = col.width, DoCellUpdate = col.func, colName = name, sortNext = col.sortNext }
      )
   else
      self.votingFrame:RemoveColumn(name)
   end
   if self.votingFrame.frame then -- We might need to recreate it
      addon:Debug("Resetting votingFrame.frame")
      self.votingFrame.frame = nil
      self.votingFrame.frame = self.votingFrame:GetFrame()
   end
end

function EU:BuildData()
   local forged,_,sockets, upgrades, legend, ilvl = self:GetEquippedItemData()
   return { -- Data is placeholder for now
      --pawn = 304,
      forged = forged,
      traits = select(6,C_ArtifactUI.GetEquippedArtifactInfo()),
      --setPieces = 0,
      sockets = sockets,
      upgrades = upgrades,
      legend = legend,
      upgradeIlvl = ilvl,
   }
end

function EU:GetEquippedItemData()
   local forgedTable = {
      [3336] = "Warforged",
      [3337] = "Titanforged",   }
   local legendaries = { -- NOTE Really not sure about these, but I haven't seen a Legendary without one of these bonusIDs
      [1811] = true,
      [3458] = true,   }

   local titanforged, setPieces, sockets, legend = 0, 0, 0, 0
   local upgradeIlvl, upg, upgMax = 0, 0, 0
   for i = 1, 17 do
      if i ~= 4 then
         local link = GetInventoryItemLink("player", i)
         if link then
            local upgrade, max, delta = ItemUpgradeInfo:GetItemUpgradeInfo(item or " ")
            if upgrade then
               upg = upg + upgrade
               upgMax = upgMax + max
               upgradeIlvl = upgradeIlvl + delta
            end
            local color, itemType, itemID, enchantID, gemID1, gemID2, gemID3, gemID4, suffixID, uniqueID, linkLevel,
   	 		specializationID, upgradeTypeID, upgradeID, instanceDifficultyID, numBonuses, bonusIDs = addon:DecodeItemLink(link)

            if (gemID1 > 0 or gemID2 > 0) and i ~= 16 then -- Avoid artifact as it has relics in its' gemIDs
               sockets = sockets + 1
            end

            if numBonuses > 0 then
               for _, v in ipairs(bonusIDs) do
                  if forgedTable[v] then
                     titanforged = titanforged + 1
                  end
                  if legendaries[v] then
                     legend = legend + 1
                     break -- Just in case the same legendary have multiple of the checked bonusIDs
                  end
               end
            end

         end
      end
   end

   return titanforged, setPieces, sockets, upg.."/"..upgMax, legend, upgradeIlvl
end

---------------------------------------------
-- Lib-st UI functions
---------------------------------------------
function EU.SetCellPawn(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   frame.text:SetText(playerData[name] and playerData[name].pawn or L["None"])
end

function EU.SetCellForged(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   frame.text:SetText(playerData[name] and playerData[name].forged or 0)
end

function EU.SetCellTraits(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   frame.text:SetText(playerData[name] and playerData[name].traits or 0)
end

function EU.SetCellPieces(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   frame.text:SetText(playerData[name] and playerData[name].setPieces or 0)
end

function EU.SetCellSocket(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   frame.text:SetText(playerData[name] and playerData[name].sockets or 0)
end

function EU.SetCellUpgrades(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   frame.text:SetText(playerData[name] and playerData[name].upgrades or 0)
end

function EU.SetCellLegend(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   frame.text:SetText("|cffff8000"..(playerData[name] and playerData[name].legend or 0))
--   frame.text:SetTextColor(255,128,0,1) -- Legendary Orange
end

function EU.SetCellIlvlUpg(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   frame.text:SetText(playerData[name] and playerData[name].upgradeIlvl or 0)
end
