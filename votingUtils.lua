-- Author      : Potdisc
-- Create Date : 10/11/2016
-- CustomModule
-- votingUtils.lua	Adds extra columns for the default voting frame

--[[
   NOTE: This is made for the Better-VotingFrame branch

   Pawn integration
   ----------------
   Noteable functions:
      PawnGetItemValue(Item, ItemLevel, SocketBonus, ScaleName, DebugMessages, NoNormalization)
         -- PawnUICurrentScale (global) should be useable as a scale
      PawnGetAllItemValues()

      PawnGetSingleValueFromItem(Item, ScaleName) -- Returns the score from a selected scale
      PawnRecalculateItemValuesIfNecessary(Item, NoNormalization) -- Returns scores from every enabled scale
]]

local addon = LibStub("AceAddon-3.0"):GetAddon("RCLootCouncil")
EU = addon:NewModule("RCExtraUtilities", "AceComm-3.0", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("RCLootCouncil")
local LE = LibStub("AceLocale-3.0"):GetLocale("RCExtraUtilities")
local ItemUpgradeInfo = LibStub("LibItemUpgradeInfo-1.0")

local playerData = {} -- Table containing all EU data received, format playerData["playerName"] = {...}
local lootTable = {}
local session = 0

function EU:OnInitialize()
   self:RegisterComm("RCLootCouncil")
   self.version = GetAddOnMetadata("RCLootCouncil_ExtraUtilities", "Version")

   self.defaults = {
      profile = {
         columns = {
            traits =          { enabled = false, pos = 10, width = 40, func = self.SetCellTraits,   name = LE["Traits"]},
            upgrades =        { enabled = false, pos = -3, width = 55, func = self.SetCellUpgrades, name = LE["Upgrades"]},
            pawn =            { enabled = false, pos = -3, width = 50, func = self.SetCellPawn,     name = "Pawn"},
            sockets =         { enabled = false, pos = 11, width = 45, func = self.SetCellSocket,   name = LE["Sockets"]},
         -- setPieces =       { enabled = true, pos = 11, width = 40, func = self.SetCellPieces,   name = LE["Set Pieces"]},
            titanforged =     { enabled = false, pos = 10, width = 40, func = self.SetCellForged,   name = LE["Forged"]},
            legendaries =     { enabled = false, pos = 11, width = 55, func = self.SetCellLegend,   name = LE["Legendaries"]},
            ilvlUpgrade =     { enabled = false, pos = -4, width = 50, func = self.SetCellIlvlUpg,  name = LE["ilvl Upg."]},
            spec =            { enabled = false, pos = 1,  width = 20, func = self.SetCellSpecIcon, name = ""},
         },
         normalColumns = {
            class =  { enabled = true, name = LE.Class},
            rank =   { enabled = true, name = L.Rank},
            role =   { enabled = true, name = L.Role},
            ilvl =   { enabled = true, name = L.ilvl},
            diff =   { enabled = true, name = L.Diff},
            roll =   { enabled = true, name = L.Roll},
         },
         pawn = { -- Default Pawn scales
            WARRIOR = {
               [71] = '"MrRobot":WARRIOR1', -- Arms
               [72] = '"MrRobot":WARRIOR2', -- Fury
               [73] = '"MrRobot":WARRIOR3', -- Protection
            },
         	DEATHKNIGHT = {
               [250] = '"MrRobot":DEATHKNIGHT1', -- Blood
               [251] = '"MrRobot":DEATHKNIGHT2', -- Frost
               [252] = '"MrRobot":DEATHKNIGHT3', -- Unholy
            },
         	PALADIN = {
               [65] = '"MrRobot":PALADIN1', -- Holy
               [66] = '"MrRobot":PALADIN2', -- Protection
               [70] = '"MrRobot":PALADIN3', -- Retribution
            },
         	MONK = {
               [268] = '"MrRobot":MONK1', -- Brewmaster
               [269] = '"MrRobot":MONK2', -- Windwalker
               [270] = '"MrRobot":MONK3', -- Mistweaver
            },
         	PRIEST = {
               [256] = '"MrRobot":PRIEST1', -- Discipline
               [257] = '"MrRobot":PRIEST2', -- Holy
               [258] = '"MrRobot":PRIEST3', -- Shadow
            },
         	SHAMAN = {
               [262] = '"MrRobot":SHAMAN1', -- Elemental
               [263] = '"MrRobot":SHAMAN2', -- Enhancement
               [264] = '"MrRobot":SHAMAN3', -- Restoration
            },
         	DRUID = {
               [102] = '"MrRobot":DRUID1', -- Balance
               [103] = '"MrRobot":DRUID2', -- Feral
               [104] = '"MrRobot":DRUID3', -- Guardian
               [105] = '"MrRobot":DRUID4', -- Restoration
            },
         	ROGUE = {
               [259] = '"MrRobot":ROGUE1', -- Assassination
               [260] = '"MrRobot":ROGUE2', -- Outlaw
               [261] = '"MrRobot":ROGUE3', -- Subtlety
            },
         	MAGE = {
               [62] = '"MrRobot":MAGE1', -- Arcane
               [63] = '"MrRobot":MAGE2', -- Fire
               [64] = '"MrRobot":MAGE3', -- Frost
            },
         	WARLOCK = {
               [265] = '"MrRobot":WARLOCK1', -- Affliction
               [266] = '"MrRobot":WARLOCK2', -- Demonology
               [267] = '"MrRobot":WARLOCK3', -- Destruction
            },
         	HUNTER = {
               [253] = '"MrRobot":HUNTER1', -- Beast Mastery
               [254] = '"MrRobot":HUNTER2', -- Marksmanship
               [255] = '"MrRobot":HUNTER3', -- Survival
            },
         	DEMONHUNTER = {
               [577] = '"MrRobot":DEMONHUNTER1', -- Havoc
               [581] = '"MrRobot":DEMONHUNTER2', -- Vengeance
            },
         }
      }
   }

   addon.db:RegisterNamespace("ExtraUtilities", self.defaults)
   self.db = addon.db:GetNamespace("ExtraUtilities").profile
   self:OptionsTable()
   self:Enable()
   addon:CustomChatCmd(self, "OpenOptions", "EU", "eu")
   self:RegisterEvent("BONUS_ROLL_RESULT", "BONUS_ROLL_RESULT")
end

function EU:OpenOptions()
   InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
   InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
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

   -- Hook SwitchSession() so we know which session we're on
   self:Hook(self.votingFrame, "SwitchSession", function(_, s) session = s end)

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
            -- And grap a copy
            lootTable = unpack(data)

         elseif command == "extraUtilData" then
            -- We received our EU data
            local name, data = unpack(data)
            playerData[name] = data
            addon:Debug("Received EUData", data.specID)

         elseif command == "extraUtilDataRequest" then
            addon:SendCommand("group", "extraUtilData", addon.playerName, self:BuildData())
         end
      end
   end
end

-- TODO
function EU:BONUS_ROLL_RESULT(event, rewardType, rewardLink, rewardQuantity, rewardSpecID)
   addon:Debug("BONUS_ROLL_RESULT", rewardType, rewardLink, rewardQuantity, rewardSpecID)
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
            col.func = v.DoCellUpdate
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
      tinsert(self.votingFrame.scrollCols, pos,
         {name = col.name, align = "CENTER", width = col.width, DoCellUpdate = col.func, colName = name, sortNext = col.sortNext }
      )
   else
      self.votingFrame:RemoveColumn(name)
   end
   if self.votingFrame.frame then -- We might need to recreate it
      self.votingFrame.frame.UpdateSt()
   end
end

function EU:BuildData()
   local forged,_,sockets, upgrades, legend, ilvl = self:GetEquippedItemData()
   return {
      forged = forged,
      traits = select(6,C_ArtifactUI.GetEquippedArtifactInfo()),
      --setPieces = 0,
      sockets = sockets,
      upgrades = upgrades,
      legend = legend,
      upgradeIlvl = ilvl,
      specID = (GetSpecializationInfo(GetSpecialization())),
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
   -- We know which session we're on, we have the item link from lootTable, and we have access to Set/Get candidate data
   -- We'll calculate the Pawn score here for each item/candidate and store the result in votingFrames' data
   local score
   if playerData[name] and playerData[name][session] and playerData[name][session].pawn then
      score = EU.votingFrame:GetCandidateData(session, name, "pawn")

   elseif lootTable[session] and lootTable[session].link then
      local class = EU.votingFrame:GetCandidateData(session, name, "class")
      local specID = playerData[name] and playerData[name].specID
      if specID then -- SpecID might not be received yet, so don't bother checking further
         local item = PawnGetItemData(lootTable[session].link)
         if class and specID and item then
            -- Try and force NormalizationFactor
            PawnCommon.Scales[EU.db.pawn[class][specID]].NormalizationFactor = 1
            score = PawnGetSingleValueFromItem(item, EU.db.pawn[class][specID])
            EU.votingFrame:SetCandidateData(session, name, "pawn", score)
            playerData[name][session] = {pawn = score}
         end
      end
   end
   data[realrow].cols[column].value = score or 0
   frame.text:SetText(score and addon.round(score,1) or L["None"])
   if score then
      frame.text:SetTextColor(1,1,1,1)
   else
      frame.text:SetTextColor(0.7, 0.7,0.7,1)
   end
end

function EU.SetCellForged(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   local val = playerData[name] and playerData[name].forged or 0
   frame.text:SetText(val)
   data[realrow].cols[column].value = val
end

function EU.SetCellTraits(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   local val = playerData[name] and playerData[name].traits or 0
   frame.text:SetText(val)
   data[realrow].cols[column].value = val
end

function EU.SetCellPieces(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   local val = playerData[name] and playerData[name].setPieces or 0
   frame.text:SetText(val)
   data[realrow].cols[column].value = val
end

function EU.SetCellSocket(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   local val = playerData[name] and playerData[name].sockets or 0
   frame.text:SetText(val)
   data[realrow].cols[column].value = val
end

function EU.SetCellUpgrades(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   local val = playerData[name] and playerData[name].upgrades or 0
   frame.text:SetText(val)
   data[realrow].cols[column].value = val
end

function EU.SetCellLegend(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   local val = "|cffff8000"..(playerData[name] and playerData[name].legend or 0)
   frame.text:SetText(val)
   data[realrow].cols[column].value = val
end

function EU.SetCellIlvlUpg(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
   local val = playerData[name] and playerData[name].upgradeIlvl or 0
   frame.text:SetText(val)
   data[realrow].cols[column].value = val
end

function EU.SetCellSpecIcon(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
   local name = data[realrow].name
	local specID = playerData[name] and playerData[name].specID
   local icon
   if specID then
      icon = select(4,GetSpecializationInfoByID(specID))
   end
	if icon then
		frame:SetNormalTexture(icon);
	else -- if there's no class
		frame:SetNormalTexture("Interface/ICONS/INV_Sigil_Thorim.png")
	end
end
