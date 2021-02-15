-- Author      : Potdisc
-- Create Date : 10/11/2016
-- CustomModule
-- votingUtils.lua	Adds extra columns for the default voting frame
--[[ Comms: (All are permanent)
      MAIN:
         lootTable
         lt_add
         bonus_roll
         cov
      RCLCeu:
         data         - Candidate sends EU data packet.
         dataR        - Candidate requests EU data packet.

]] local addon = LibStub("AceAddon-3.0"):GetAddon("RCLootCouncil")
EU = addon:NewModule("RCExtraUtilities", "AceComm-3.0", "AceConsole-3.0",
                     "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("RCLootCouncil")
local LE = LibStub("AceLocale-3.0"):GetLocale("RCExtraUtilities")
local ItemUpgradeInfo = LibStub("LibItemUpgradeInfo-1.0")

local Log = addon.Require "Log"
local Comms = addon.Require "Services.Comms"
--- @type Data.Player
local Player = addon.Require "Data.Player"
---@type Cache
local Cache = addon.Require "Data.Cache":GetNewCache(86400) -- 1 day cache time

local commsPrefix = "RCLCeu"

local playerData = {} -- Table containing all EU data received, format playerData["playerName"] = {...}
local lootTable = {}
local session = 0
local guildInfo = {}
local debugPawn = false
local debugRCScore = false

local unpack, pairs, ipairs, UnitGUID = unpack, pairs, ipairs, UnitGUID

function EU:OnInitialize()
    self.version = GetAddOnMetadata("RCLootCouncil_ExtraUtilities", "Version")
    self.tVersion = "Alpha.1"
    self.Log = Log:New "EU"
    self.defaults = {
        profile = {
            columns = addon.isClassic and { -- Classic
                pawn = {
                    enabled = false,
                    pos = -3,
                    width = 50,
                    func = self.SetCellPawn,
                    name = "Pawn"
                },
                setPieces = {
                    enabled = true,
                    pos = 11,
                    width = 40,
                    func = self.SetCellPieces,
                    name = LE["Set Pieces"]
                },
                legendaries = {
                    enabled = false,
                    pos = 11,
                    width = 55,
                    func = self.SetCellLegend,
                    name = LE["Legendaries"]
                },
                guildNotes = {
                    enabled = false,
                    pos = -1,
                    width = 45,
                    func = self.SetCellGuildNote,
                    name = LE["GuildNote"]
                }
            } or { -- Retail
                --   upgrades =        { enabled = false, pos = -3, width = 55, func = self.SetCellUpgrades, name = LE["Upgrades"]},
                pawn = {
                    enabled = false,
                    pos = 7,
                    width = 50,
                    func = self.SetCellPawn,
                    name = "Pawn"
                },
                sockets = {
                    enabled = false,
                    pos = 11,
                    width = 45,
                    func = self.SetCellSocket,
                    name = LE["Sockets"]
                },
                -- setPieces =       { enabled = true, pos = 11, width = 40, func = self.SetCellPieces,   name = LE["Set Pieces"]},
                legendaries = {
                    enabled = false,
                    pos = 11,
                    width = 55,
                    func = self.SetCellLegend,
                    name = LE["Legendaries"]
                },
                --   ilvlUpgrade =     { enabled = false, pos = -4, width = 50, func = self.SetCellIlvlUpg,  name = LE["ilvl Upg."]},
                spec = {
                    enabled = false,
                    pos = 1,
                    width = 20,
                    func = self.SetCellSpecIcon,
                    name = ""
                },
                bonus = {
                    enabled = false,
                    pos = 100,
                    width = 40,
                    func = self.SetCellBonusRoll,
                    name = LE["Bonus"]
                },
                guildNotes = {
                    enabled = false,
                    pos = -1,
                    width = 45,
                    func = self.SetCellGuildNote,
                    name = LE["GuildNote"]
                },

                covenant = {
                    enabled = true,
                    pos = 8,
                    width = 45,
                    func = self.SetCellCovenant,
                    name = "Covenant"
                }

                -- rcscore =         { enabled = false, pos = 16, width = 50, func = self.SetCellRCScore, name = "RC Score"},
            },
            normalColumns = (function()
                local ret = {
                    class = {enabled = true, name = LE.Class, width = 20},
                    rank = {enabled = true, name = _G.RANK, width = 95},
                    role = {enabled = true, name = _G.ROLE, width = 55},
                    ilvl = {
                        enabled = true,
                        name = _G.ITEM_LEVEL_ABBR,
                        width = 45
                    },
                    diff = {enabled = true, name = L.Diff, width = 40},
                    roll = {enabled = true, name = _G.ROLL, width = 30},

                    name = {enabled = "", name = _G.NAME, width = 120},
                    response = {enabled = "", name = L.Response, width = 240},
                    gear1 = {enabled = "", name = L.g1, width = 20},
                    gear2 = {enabled = "", name = L.g2, width = 20},
                    votes = {enabled = "", name = L.Votes, width = 40},
                    vote = {enabled = "", name = L.Vote, width = 60},
                    note = {enabled = "", name = L.Notes, width = 40}
                }
                if addon.isClassic then ret.role = nil end
                return ret
            end)(),
            acceptPawn = true, -- Allow Pawn scores sent from candidates
            pawnNormalMode = false, -- Scoring mode, % or normal
            pawn = -- Default Pawn scales
            (function()
                if addon.isClassic then
                    return
                        { -- Classic doesn't have specs per say, so use the same index as pawn does
                            WARRIOR = {
                                '"Classic":WARRIOR1', -- Arms
                                '"Classic":WARRIOR2', -- Fury
                                '"Classic":WARRIOR3' -- Protection
                            },
                            PALADIN = {
                                '"Classic":PALADIN1', -- Holy
                                '"Classic":PALADIN2', -- Protection
                                '"Classic":PALADIN3' -- Retribution
                            },
                            PRIEST = {
                                '"Classic":PRIEST1', -- Discipline
                                '"Classic":PRIEST2', -- Holy
                                '"Classic":PRIEST3' -- Shadow
                            },
                            SHAMAN = {
                                '"Classic":SHAMAN1', -- Elemental
                                '"Classic":SHAMAN2', -- Enhancement
                                '"Classic":SHAMAN3' -- Restoration
                            },
                            DRUID = {
                                '"Classic":DRUID1', -- Balance
                                '"Classic":DRUID2', -- Feral
                                '"Classic":DRUID3', -- Guardian
                                '"Classic":DRUID4' -- Restoration
                            },
                            ROGUE = {
                                '"Classic":ROGUE1', -- Assassination
                                '"Classic":ROGUE2', -- Combat
                                '"Classic":ROGUE3' -- Subtlety
                            },
                            MAGE = {
                                '"Classic":MAGE1', -- Arcane
                                '"Classic":MAGE2', -- Fire
                                '"Classic":MAGE3' -- Frost
                            },
                            WARLOCK = {
                                '"Classic":WARLOCK1', -- Affliction
                                '"Classic":WARLOCK2', -- Demonology
                                '"Classic":WARLOCK3' -- Destruction
                            },
                            HUNTER = {
                                '"Classic":HUNTER1', -- Beast Mastery
                                '"Classic":HUNTER2', -- Marksmanship
                                '"Classic":HUNTER3' -- Survival
                            }
                        }
                else
                    return {
                        WARRIOR = {
                            [71] = '"MrRobot":WARRIOR1', -- Arms
                            [72] = '"MrRobot":WARRIOR2', -- Fury
                            [73] = '"MrRobot":WARRIOR3' -- Protection
                        },
                        DEATHKNIGHT = {
                            [250] = '"MrRobot":DEATHKNIGHT1', -- Blood
                            [251] = '"MrRobot":DEATHKNIGHT2', -- Frost
                            [252] = '"MrRobot":DEATHKNIGHT3' -- Unholy
                        },
                        PALADIN = {
                            [65] = '"MrRobot":PALADIN1', -- Holy
                            [66] = '"MrRobot":PALADIN2', -- Protection
                            [70] = '"MrRobot":PALADIN3' -- Retribution
                        },
                        MONK = {
                            [268] = '"MrRobot":MONK1', -- Brewmaster
                            [269] = '"MrRobot":MONK2', -- Windwalker
                            [270] = '"MrRobot":MONK3' -- Mistweaver
                        },
                        PRIEST = {
                            [256] = '"MrRobot":PRIEST1', -- Discipline
                            [257] = '"MrRobot":PRIEST2', -- Holy
                            [258] = '"MrRobot":PRIEST3' -- Shadow
                        },
                        SHAMAN = {
                            [262] = '"MrRobot":SHAMAN1', -- Elemental
                            [263] = '"MrRobot":SHAMAN2', -- Enhancement
                            [264] = '"MrRobot":SHAMAN3' -- Restoration
                        },
                        DRUID = {
                            [102] = '"MrRobot":DRUID1', -- Balance
                            [103] = '"MrRobot":DRUID2', -- Feral
                            [104] = '"MrRobot":DRUID3', -- Guardian
                            [105] = '"MrRobot":DRUID4' -- Restoration
                        },
                        ROGUE = {
                            [259] = '"MrRobot":ROGUE1', -- Assassination
                            [260] = '"MrRobot":ROGUE2', -- Outlaw
                            [261] = '"MrRobot":ROGUE3' -- Subtlety
                        },
                        MAGE = {
                            [62] = '"MrRobot":MAGE1', -- Arcane
                            [63] = '"MrRobot":MAGE2', -- Fire
                            [64] = '"MrRobot":MAGE3' -- Frost
                        },
                        WARLOCK = {
                            [265] = '"MrRobot":WARLOCK1', -- Affliction
                            [266] = '"MrRobot":WARLOCK2', -- Demonology
                            [267] = '"MrRobot":WARLOCK3' -- Destruction
                        },
                        HUNTER = {
                            [253] = '"MrRobot":HUNTER1', -- Beast Mastery
                            [254] = '"MrRobot":HUNTER2', -- Marksmanship
                            [255] = '"MrRobot":HUNTER3' -- Survival
                        },
                        DEMONHUNTER = {
                            [577] = '"MrRobot":DEMONHUNTER1', -- Havoc
                            [581] = '"MrRobot":DEMONHUNTER2' -- Vengeance
                        }
                    }
                end
            end)()

        }
    }
    -- The order of which the new cols appear in the advanced options
    self.optionsColOrder = addon.isClassic and
                               {
            "pawn", "setPieces", "legendaries", "guildNotes"
        } or {
        "pawn", "legendaries", "sockets", "spec", "bonus", "guildNotes",
        "covenant" --[["rcscore"]]
    }
    -- The order of which the normal cols appear ANYWHERE in the options
    self.optionsNormalColOrder = addon.isClassic and {
        "class", "name", "rank", "response", "ilvl", "diff", "gear1", "gear2",
        "votes", "vote", "note", "roll"
    } or {
        "class", "name", "rank", "role", "response", "ilvl", "diff", "gear1",
        "gear2", "votes", "vote", "note", "roll"
    }

    addon.db:RegisterNamespace("ExtraUtilities", self.defaults)
    self.db = addon.db:GetNamespace("ExtraUtilities").profile
    self:FixOldOptions()

    -- Setup chat command for options
    addon:ModuleChatCmd(self, "OpenOptions", nil, LE["chat_cmd_desc"], "eu",
                        "extrautilities")

    Comms:RegisterPrefix(commsPrefix)
    self.Send = Comms:GetSender(commsPrefix)
    self:ScheduleTimer("Enable", 1) -- Delay a bit
end

function EU:OpenOptions()
    InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
end

function EU:GetPlayerData() return playerData end

function EU:OnEnable()
    self.Log("Enabled", self.version)
    self:SetupComms()
    -- Get the voting frame
    self.votingFrame = addon:GetActiveModule("votingframe")
    -- Crap a copy of the cols
    self.originalCols = {unpack(self.votingFrame.scrollCols)}

    -- Setup options
    self:OptionsTable()

    -- Hook SwitchSession() so we know which session we're on
    self:Hook(self.votingFrame, "SwitchSession", function(_, s) session = s end)

    -- Hook addon.OnLootTableReceived, as we can't yet guarantee the comms callback order.
    self:SecureHook(addon, "OnLootTableReceived", "OnLootTableReceived")

    -- Translate sortNext into colNames
    self.sortNext = {}
    for _, v in ipairs(self.votingFrame.scrollCols) do
        if v.sortNext then
            self.sortNext[v.colName] = self.votingFrame.scrollCols[v.sortNext]
                                           .colName
        end
    end
    -- Make sure we handle external requirements
    self:HandleExternalRequirements()
    -- Setup our columns
    self:SetupColumns()

    self:UpdateGuildInfo()
end

function EU:OnDisable()
    -- Reset cols
    self.votingFrame.scrollCols = self.originalCols
    self:UnregisterAllComm()
    self:UnregisterAllEvents()
    self:UnhookAll()
end

function EU:SetupComms(args)
    -- RCLootCouncil Comms:
    Comms:BulkSubscribe(addon.PREFIXES.MAIN, {
        lt_add = function()
            if _G.PawnVersion then -- Currently only Pawn has session specific data
                self:Send("group", "data", self:BuildData())
            end
        end,

        bonus_roll = function(data, sender)
            local type, link = unpack(data)
            self:OnBonusRollReceived(sender, type, link)
        end,

        cov = function(data, sender)
            self:OnCovenantDataReceived(sender, unpack(data))
        end

    })
    -- EU Comms:
    Comms:BulkSubscribe(commsPrefix, {
        data = function(data, sender)
            self:OnEUDataReceived(sender, unpack(data))
        end,
        dataR = function(data, sender)
            self:Send("group", "data", self:BuildData())
        end
    })
end

function EU:OnLootTableReceived()
    self.Log:D("OnLootTableReceived")
    -- And grap a copy
    lootTable = addon:GetLootTable()
    -- Send out our data
    self:Send("group", "data", self:BuildData())

    -- Setup player data if it doesn't exist yet
    if not next(playerData) then
        for name in addon:GroupIterator() do playerData[name] = {} end
    end
    -- Clear old bonus references
    for name, v in pairs(playerData) do
        if v.bonusReference and v.bonusReference ~= addon.bossName then
            v.bonusType = nil
            v.bonusLink = nil
            v.bonusReference = nil
        end
        if not v.covenantID then
            self.Log:D("No covenantID for ", name)
            local id = Cache:Get(name .. "covenantID")
            if id then
                self.Log:D("Found cached ", id)
                v.covenantID = id
            else
                self.Log:D("Requsting ID")
                Comms:Send{
                    prefix = addon.PREFIXES.MAIN,
                    taget = Player:Get(name),
                    command = "getCov"
                }
            end
        end
    end
    self.votingFrame:Update()
end

function EU:OnCovenantDataReceived(name, covenantID)
    self.Log:D("OnCovenantDataReceived", name, covenantID)
    Cache:Set(name .. "covenantID", covenantID)
    if not playerData[name] then playerData[name] = {} end
    playerData[name].covenantID = covenantID
    self.votingFrame:Update()
end

function EU:OnBonusRollReceived(name, type, link)
    if not playerData[name] then playerData[name] = {} end
    playerData[name].bonusType = type
    playerData[name].bonusLink = link
    playerData[name].bonusReference = addon.bossName
    self.votingFrame:Update()
end

function EU:OnEUDataReceived(name, data)
    playerData[name] = playerData[name] or {}
    for k, v in pairs(data) do playerData[name][k] = v end
    self.votingFrame:Update()
end

function EU:HandleExternalRequirements()
    -- Pawn
    if self.db.columns.pawn.enabled and not _G.PawnVersion then
        self.db.columns.pawn.enabled = false
        addon:Print(LE["Pawn column was disabled as Pawn isn't installed."])
    end
    -- RCScore
    if self.db.columns.rcscore and self.db.columns.rcscore.enabled and
        not (_G.Details or _G.Recount or _G.Skada) then
        self.db.columns.rcscore.enabled = false
        addon:Print(
            LE["RCScore column was disabled as no damage meter is installed."])
    end
end

--- Adds or removes a column based on its name in self.db.columns/normalColumns
function EU:UpdateColumn(name, add)
    self.Log:D("UpdateColumn", name, add)
    local col = self.db.columns[name]
    if not col then -- It's one of the default RC columns
        -- find its' data
        for k, v in ipairs(self.originalCols) do
            if v.colName == name then
                -- We got it!
                col = v
                col.pos = k
                col.func = v.DoCellUpdate
                col.width = self.db.normalColumns[name].width or v.width -- We might have overridden the orignial value
            end
        end
    end
    if add then
        local pos
        if col.pos < 0 then
            pos = #self.votingFrame.scrollCols + col.pos -- col.pos is negative, so add it for the desired effect
        elseif col.pos > #self.votingFrame.scrollCols then
            pos = #self.votingFrame.scrollCols
        else
            pos = col.pos
        end
        tinsert(self.votingFrame.scrollCols, pos, {
            name = col.name,
            align = "CENTER",
            width = col.width,
            DoCellUpdate = col.func,
            colName = name,
            sortNext = col.sortNext
        })
    else
        self.votingFrame:RemoveColumn(name)
    end
    if self.votingFrame.frame then -- We might need to recreate it
        self.votingFrame.frame.UpdateSt()
    end
    self:UpdateSortNext()
end

--- Completely resets all columns
function EU:SetupColumns()
    -- First we need to know the order of the columns, so extract from both tables:
    local cols = {} -- The cols we want to use
    for name, v in pairs(self.db.columns) do -- EU cols First
        if v.enabled then tinsert(cols, {name = name, pos = v.pos}) end
    end
    for name, v in pairs(self.db.normalColumns) do -- then the default
        if v.enabled then
            tinsert(cols, {
                name = name,
                pos = v.pos and v.pos or self:GetScrollColIndexFromName(name)
            })
        end
    end
    -- Now we know which columns to add, but we need to "translate" any negative or 0 positions
    for _, v in ipairs(cols) do
        if v.pos < 0 then v.pos = #cols + v.pos end
        if v.pos == 0 then v.pos = 1 end
    end
    -- Now sort the table to get the actual order:
    table.sort(cols, function(a, b) return a.pos < b.pos end)
    -- Now inject
    local temp
    local newCols = {}
    for _, v in ipairs(cols) do
        -- wipe(temp)
        if self.db.columns[v.name] then -- handle EU column
            temp = self.db.columns[v.name]
            tinsert(newCols, {
                name = temp.name,
                align = temp.align or "CENTER",
                width = temp.width,
                DoCellUpdate = temp.func,
                colName = v.name,
                sortNext = temp.sortNext or
                    self:GetScrollColIndexFromName("reponse")
            })
        else -- Handle default column
            local i = self:GetScrollColIndexFromName(v.name)
            temp = self.votingFrame.scrollCols[i]
            temp.width = self.db.normalColumns[v.name].width
            tinsert(newCols, temp)
        end

    end
    self.votingFrame.scrollCols = {unpack(newCols)}
    self:UpdateSortNext()
end

--- Updates the sortNext index on scrollCols
-- Shouldn't be called until all columns have been set up.
function EU:UpdateSortNext()
    for index in ipairs(self.votingFrame.scrollCols) do
        if self.votingFrame.scrollCols[index].sortNext then
            local exists = self:GetScrollColIndexFromName(
                               self.sortNext[self.votingFrame.scrollCols[index]
                                   .colName])
            self.votingFrame.scrollCols[index].sortNext = exists
        end
    end
end

function EU:UpdateColumnWidth(name, width)
    -- Our storage has now been updated, but we still need to edit it in the scrollCols table:
    local i = self:GetScrollColIndexFromName(name)
    self.votingFrame.scrollCols[i].width = width
    -- The frame might not yet be created, so check before altering anything
    if self.votingFrame.frame then
        -- Update the width of the cols
        self.votingFrame.frame.st:SetDisplayCols(self.votingFrame.scrollCols)
        -- Now update the frame width
        self.votingFrame.frame:SetWidth(
            self.votingFrame.frame.st.frame:GetWidth() + 20)
    end
end

function EU:UpdateColumnPosition(name, pos)
    -- Find the index in scrollCols
    local i = self:GetScrollColIndexFromName(name)
    -- We might need to change pos abit
    if pos < 0 then -- "from the back, i.e. add it"
        pos = #self.votingFrame.scrollCols + pos
    end
    if pos > #self.votingFrame.scrollCols then
        pos = #self.votingFrame.scrollCols
    end
    if pos == 0 then pos = 1 end
    -- Move the column and update
    tinsert(self.votingFrame.scrollCols, pos,
            tremove(self.votingFrame.scrollCols, i))
    self:UpdateSortNext()
    if self.votingFrame.frame then -- Frame might not be created
        self.votingFrame.frame.st:SetDisplayCols(self.votingFrame.scrollCols)
        self.votingFrame.frame.st:SortData()
    end
end

function EU:GetScrollColIndexFromName(name)
    return self.votingFrame:GetColumnIndexFromName(name)
end

local function calcPawnScore(spec)
    EU.Log:D("calcPawnScore for ", spec)
    local score = {}
    -- Calculate pawn scoresg
    if _G.PawnVersion then
        for session, v in ipairs(lootTable) do
            score[session] = {}
            score[session].new = addon.round(
                                     EU:GetPawnScore(v.link, addon.playerClass,
                                                     spec) or 0, 3)
            local item1, item2 = addon:GetPlayersGear(v.link, v.equipLoc)
            -- Find the lowest score and use that
            local score1 = EU:GetPawnScore(item1, addon.playerClass, spec)
            local score2 = EU:GetPawnScore(item2, addon.playerClass, spec)
            EU.Log:D("Scores:", score1, score2)
            score[session].equipped = addon.round(
                                          (score2 and score1 > score2) and
                                              score2 or score1 or 0, 3)
            EU.Log:D("Pawn score:", session, score[session].equipped)
        end

    end
    return score
end

function EU:BuildData()
    local forged, setPieces, sockets, upgrades, legend, ilvl = self:GetEquippedItemData() -- luacheck: no unused

    if addon.isClassic then
        return {setPieces = 0, legend = legend, pawn = calcPawnScore(0)}
    else
        local spec = (GetSpecializationInfo(GetSpecialization()))
        return {
            -- forged = forged,
            -- setPieces = 0,
            sockets = sockets,
            -- upgrades = upgrades,
            legend = legend,
            -- upgradeIlvl = ilvl,
            specID = spec,
            pawn = calcPawnScore(spec)
        }
    end
end

function EU:GetEquippedItemData()
    local forgedTable = {[4783] = "Warforged", [4784] = "Titanforged"}

    local titanforged, setPieces, sockets, legend = 0, 0, 0, 0
    local upgradeIlvl, upg, upgMax = 0, 0, 0
    for i = 1, 17 do
        if i ~= 4 then
            local link = GetInventoryItemLink("player", i)
            if link then
                local upgrade, max, delta =
                    ItemUpgradeInfo:GetItemUpgradeInfo(link or " ")
                if upgrade then
                    upg = upg + upgrade
                    upgMax = upgMax + max
                    upgradeIlvl = upgradeIlvl + delta
                end
                local color, itemType, itemID, enchantID, gemID1, gemID2, -- luacheck: no unused
                      gemID3, gemID4, suffixID, uniqueID, linkLevel, -- luacheck: no unused
                      specializationID, upgradeTypeID, upgradeID, -- luacheck: no unused
                      instanceDifficultyID, numBonuses, bonusIDs = -- luacheck: no unused
                    addon:DecodeItemLink(link) -- luacheck: no unused

                if color == "ff8000" then legend = legend + 1 end

                if (gemID1 > 0 or gemID2 > 0) and i ~= 16 then -- Avoid artifact as it has relics in its' gemIDs
                    sockets = sockets + 1
                end

                if numBonuses > 0 then
                    for _, v in ipairs(bonusIDs) do
                        if forgedTable[v] then
                            titanforged = titanforged + 1
                        end
                    end
                end

                if (select(16, GetItemInfo(link))) then
                    setPieces = setPieces + 1
                end
            end
        end
    end

    return titanforged, setPieces, sockets, upg .. "/" .. upgMax, legend,
           upgradeIlvl
end

function EU:UpdateGuildInfo()
    self.Log:D("EU:UpdateGuildInfo")
    addon.Utils:GuildRoster()
    for i = 1, GetNumGuildMembers() do
        local name, _, _, _, _, _, note, officernote = GetGuildRosterInfo(i)
        guildInfo[name] = {note, officernote}
    end
end

function EU:StripTextures()
    if not (self.votingFrame.frame and self.votingFrame.frame:IsVisible()) then
        return
    end
    for k in ipairs(self.votingFrame.scrollCols) do
        for row = 1, self.votingFrame.frame.st.displayRows do
            local frame = self.votingFrame.frame.st.rows[row].cols[k]
            frame:SetNormalTexture("")
            frame.text:SetTextColor(1, 1, 1, 1)
            if frame.voteBtn then
                frame.voteBtn:Hide();
                frame.voteBtn = nil
            end
            if frame.noteBtn then
                frame.noteBtn:Hide();
                frame.noteBtn = nil
            end
            if frame.bonusBtn then
                frame.bonusBtn:Hide();
                frame.bonusBtn = nil
            end
        end
    end
    self.votingFrame.frame.st:Refresh()
end

-- A 10 value gradient going from 1-3: red ->4-7: yellow -> 8-10: green
local colorGradient = {
    [0] = {0.7, 0.7, 0.7}, -- 0 #b2b2b2
    {0.7, 0, 0}, -- 1  #b20000
    {0.6, 0.1, 0}, -- 2  #991900
    {0.6, 0.2, 0}, -- 3  #993300
    {0.6, 0.4, 0}, -- 4  #996600
    {1, 1, 0}, -- 5  #ffff00
    {1, 1, 0}, -- 6  #ffff00
    {0.8, 1, 0}, -- 7  #ccff00
    {0.5, 1, 0}, -- 8  #7fff00
    {0.3, 1, 0}, -- 9  #4cff00
    {0, 1, 0} -- 10 #00ff00
}

-- Returns a Pawn score calculated based on the select scale in the EU options
-- mathcing the class and spec
function EU:GetPawnScore(link, class, spec)
    if debugPawn then self.Log:D("GetPawnScore", link, class, spec) end
    local item = _G.PawnGetItemData(link)
    if not (item and class and spec) then
        return self.Log:E("GetPawnScore", link, item, class, spec)
    end
    local scaleName = addon.isClassic and
                          _G.PawnFindScaleForSpec(addon.classTagNameToID[class]) or
                          self.db.pawn[class][spec]
    -- Normalize
    _G.PawnCommon.Scales[scaleName].NormalizationFactor = 1
    local score = _G.PawnGetSingleValueFromItem(item, scaleName)
    return score
end

-- Calculates a color for the score
-- Accepts normal or percent mode. Percent mode simply returns red/green for <0 / >=0
-- while normal is gradient based around the current session's max score
function EU:GetPawnScoreColor(score, mode)
    local r, g, b, a = 1, 1, 1, 1
    if type(score) == "number" then
        if mode == "%" then
            if score > 0 then -- Green
                r, b = 0, 0
            elseif score < 0 then -- Red
                g, b = 0, 0
            else -- Greyout
                r, g, b = 0.7, 0.7, 0.7
            end
        elseif mode == "normal" then -- Gradient the top 90 %
            if lootTable[session] then
                if not lootTable[session].pawnMax or lootTable[session].pawnMax <
                    score then lootTable[session].pawnMax = score end
                local val = score / lootTable[session].pawnMax
                if val > 0.1 then
                    r, g, b = 1 - val, val, 0
                else -- Greyout the 10th percentile
                    r, g, b = 0.7, 0.7, 0.7
                end
            end
        else -- Greyout
            r, g, b = 0.7, 0.7, 0.7
        end
    else -- Greyout
        r, g, b = 0.7, 0.7, 0.7
    end
    return {r, g, b, a}
end
---------------------------------------------
-- Lib-st UI functions
---------------------------------------------
function EU.SetCellPawn(rowFrame, frame, data, cols, row, realrow, column,
                        fShow, table, ...)
    local name = data[realrow].name
    -- We know which session we're on, we have the item link from lootTable, and we have access to Set/Get candidate data
    -- We can calculate the Pawn score here for each item/candidate and store the result in votingFrames' data
    local score
    -- If we've enabled it, we might have received a Pawn score from the player, in which case we want to display that.
    if EU.db.acceptPawn and playerData[name] and playerData[name].pawn and
        playerData[name].pawn[session] and playerData[name].pawn[session].new then
        -- For this we rely on our own storage:
        if EU.db.pawnNormalMode then
            score = playerData[name].pawn[session].new
        elseif playerData[name].pawn[session].equipped > 0 and
            playerData[name].pawn[session].new > 0 then
            score = (playerData[name].pawn[session].new /
                        playerData[name].pawn[session].equipped - 1) * 100
        elseif playerData[name].pawn[session].equipped == 0 and
            playerData[name].pawn[session].new > 0 then -- Major, not realistic, upgrade
            score = 100
        end

        -- If we've already calculated it, then just retrieve it from the votingFrame data:
    elseif playerData[name] and playerData[name].pawn and
        playerData[name].pawn[session] and playerData[name].pawn[session].own then
        score = EU.votingFrame:GetCandidateData(session, name, "pawn")

        -- Or just calculate it ourself
    elseif lootTable[session] and lootTable[session].link then
        local class = EU.votingFrame:GetCandidateData(session, name, "class")
        local specID = EU.votingFrame:GetCandidateData(session, name, "specID")
        if specID then -- SpecID might not be received yet, so don't bother checking further
            score = EU:GetPawnScore(lootTable[session].link, class, specID)
            if not EU.db.pawnNormalMode then -- % mode
                if score then
                    local item1 = EU.votingFrame:GetCandidateData(session, name,
                                                                  "gear1")
                    local item2 = EU.votingFrame:GetCandidateData(session, name,
                                                                  "gear2")
                    local score1 = item1 and
                                       EU:GetPawnScore(item1, class, specID)
                    local score2 = item2 and
                                       EU:GetPawnScore(item2, class, specID)
                    if score1 then
                        if not score2 or score1 < score2 then
                            score = (score / score1 - 1) * 100
                        else
                            score = (score / score2 - 1) * 100
                        end
                    else -- We haven't received the candidate's gear yet
                        score = nil -- Nullify it
                    end
                end
            end
            EU.votingFrame:SetCandidateData(session, name, "pawn", score)
            if not playerData[name] then playerData[name] = {} end
            if not playerData[name].pawn then
                playerData[name].pawn = {}
            end -- Just to be sure
            playerData[name].pawn[session] = {own = true}
        end
    end
    data[realrow].cols[column].value = score or 0
    local color
    if EU.db.pawnNormalMode then
        frame.text:SetText(score and addon.round(score, 1) or _G.NONE)
        color = EU:GetPawnScoreColor(score, "normal")
    else
        frame.text:SetText(score and (addon.round(score, 1) .. "%") or _G.NONE)
        color = EU:GetPawnScoreColor(score, "%")
    end
    frame.text:SetTextColor(unpack(color))
end

function EU.SetCellForged(rowFrame, frame, data, cols, row, realrow, column,
                          fShow, table, ...)
    local name = data[realrow].name
    local val = playerData[name] and playerData[name].forged or 0
    frame.text:SetText(val)
    data[realrow].cols[column].value = val
end

function EU.SetCellPieces(rowFrame, frame, data, cols, row, realrow, column,
                          fShow, table, ...)
    local name = data[realrow].name
    local val = playerData[name] and playerData[name].setPieces or 0
    frame.text:SetText(val)
    data[realrow].cols[column].value = val
end

function EU.SetCellSocket(rowFrame, frame, data, cols, row, realrow, column,
                          fShow, table, ...)
    local name = data[realrow].name
    local val = playerData[name] and playerData[name].sockets or 0
    frame.text:SetText(val)
    data[realrow].cols[column].value = val
end

function EU.SetCellUpgrades(rowFrame, frame, data, cols, row, realrow, column,
                            fShow, table, ...)
    local name = data[realrow].name
    local val = playerData[name] and playerData[name].upgrades or 0
    frame.text:SetText(val)
    data[realrow].cols[column].value = val
end

function EU.SetCellLegend(rowFrame, frame, data, cols, row, realrow, column,
                          fShow, table, ...)
    local name = data[realrow].name
    local val = "|cffff8000" ..
                    (playerData[name] and playerData[name].legend or 0)
    frame.text:SetText(val)
    data[realrow].cols[column].value = val
end

function EU.SetCellIlvlUpg(rowFrame, frame, data, cols, row, realrow, column,
                           fShow, table, ...)
    local name = data[realrow].name
    local val = playerData[name] and playerData[name].upgradeIlvl or 0
    frame.text:SetText(val)
    data[realrow].cols[column].value = val
end

function EU.SetCellSpecIcon(rowFrame, frame, data, cols, row, realrow, column,
                            fShow, table, ...)
    local name = data[realrow].name
    local specID = EU.votingFrame:GetCandidateData(session, name, "specID")
    local icon
    if specID then icon = select(4, GetSpecializationInfoByID(specID)) end
    if icon then
        frame:SetNormalTexture(icon);
    else -- if there's no class
        frame:SetNormalTexture("Interface/ICONS/INV_Sigil_Thorim.png")
    end
end

function EU.SetCellBonusRoll(rowFrame, frame, data, cols, row, realrow, column,
                             fShow, table, ...)
    local name = data[realrow].name
    local f = frame.bonusBtn or CreateFrame("Button", nil, frame)
    f:SetSize(table.rowHeight, table.rowHeight)
    f:SetPoint("CENTER", frame, "CENTER")
    if playerData[name] and playerData[name].bonusType then
        local type, link = playerData[name].bonusType,
                           playerData[name].bonusLink
        if type == "item" or type == "artifact_power" then
            local texture = select(10, GetItemInfo(link))
            f:SetNormalTexture(texture)
            f:SetScript("OnEnter", function()
                addon:CreateHypertip(link)
            end)
            f:SetScript("OnLeave", function() addon:HideTooltip() end)
            f:SetScript("OnClick", function()
                if IsModifiedClick() then
                    HandleModifiedItemClick(link);
                end
            end)
        elseif type == "coin" then
            -- link is gold string
            f:SetNormalTexture("Interface/Buttons/UI-GroupLoot-Coin-Up")
            f:SetScript("OnEnter",
                        function()
                addon:CreateTooltip("Gold", type, link)
            end)
            f:SetScript("OnLeave", function() addon:HideTooltip() end)
            -- self.Log:D("BonusRoll was gold", type, link)
        end
        f:Show()
    else
        f:Hide()
        f:SetScript("OnEnter", nil)
    end
    frame.bonusBtn = f
end

function EU.SetCellGuildNote(rowFrame, frame, data, cols, row, realrow, column,
                             fShow, table, ...)
    local name = data[realrow].name
    local f = frame.noteBtn or CreateFrame("Button", nil, frame)
    f:SetSize(table.rowHeight, table.rowHeight)
    f:SetPoint("CENTER", frame, "CENTER")
    if guildInfo and guildInfo[name] then
        f:SetNormalTexture("Interface/BUTTONS/UI-GuildButton-PublicNote-Up.png")
        f:SetScript("OnEnter", function()
            addon:CreateTooltip(_G.LABEL_NOTE, guildInfo[name][1], " ",
                                LE["Officer Note"], guildInfo[name][2])
        end)
        f:SetScript("OnLeave", function() addon:HideTooltip() end)
        data[realrow].cols[column].value = 1 -- Set value for sorting compability
    else
        f:SetScript("OnEnter", nil)
        f:SetNormalTexture(
            "Interface/BUTTONS/UI-GuildButton-PublicNote-Disabled.png")
        data[realrow].cols[column].value = 0
    end
    frame.noteBtn = f
end

local covenantCache = {}

local getCovenantData = function(id)
    if covenantCache[id] then return covenantCache[id] end
    if not C_Covenants then return nil end
    local data = C_Covenants.GetCovenantData(id)
    covenantCache[id] = data
    return data
end

function EU.SetCellCovenant(rowFrame, frame, data, cols, row, realrow, column,
                            fShow, table, ...)
    local name = data[realrow].name
    local covenantID = playerData[name] and playerData[name].covenantID or 0

    if not covenantID or covenantID == 0 then
        if frame.tex then frame.tex:Hide() end
        frame.text:SetText(_G.NONE)
        return
    end
    local data = getCovenantData(covenantID)
    if not data then return end -- Failsafe
    if not frame.tex then
        frame.tex = frame:CreateTexture()
        local width = frame:GetWidth()
        frame.tex:SetPoint("TOPLEFT", frame, "TOPLEFT", width / 4, 0)
        frame.tex:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -width / 4, 0)
        function frame.tex.GetObjectType() return "Texture" end -- Needed in TextureUtil with below call
    end
    SetupTextureKitOnFrame(data.textureKit, frame.tex,
                           "CovenantChoice-Celebration-%sSigil",
                           TextureKitConstants.SetVisibility,
                           TextureKitConstants.UseAtlasSize)
    frame:SetScript("OnEnter", function() addon:CreateTooltip(data.name) end)
    frame:SetScript("OnLeave", function() addon:HideTooltip() end)
    frame.text:SetText("")
end

-- Max percentile: (MOD(ilvl,893)/3+1)*101068+614274
-- local function getDPSRCScore(dps, ilvl)
-- return 100 * dps / ((ilvl % 893 / 3 + 1) * 101068 + 614274)
-- end

-- Max averaged percentile: (MOD(ilvl,893)/3+1)*86183+531928
local function getDPSRCScore2(dps, ilvl)
    return 100 * dps / ((ilvl % 893 / 3 + 1) * 86183 + 531928)
end

-- Max averaged percentile: (MOD(ilvl,893)/3+1)*60007+209101
local function getTankRCScore(dps, ilvl)
    return 100 * dps / ((ilvl % 893 / 3 + 1) * 60007 + 209101)
end

-- Max averaged percentile:(MOD(ilvl,893)/3+1)*70234+376532
local function getHealerRCScore(hps, ilvl)
    return 100 * hps / ((ilvl % 893 / 3 + 1) * 70234 + 376532)
end

function EU.getDPSFromLastFight(role, name)
    local dps = 0
    if _G.Details then
        local combat = _G.Details:GetCurrentCombat()
        if combat then
            if role == "HEALER" then -- look for hps
                local healingActor = combat:GetActor(_G.DETAILS_ATTRIBUTE_HEAL,
                                                     Ambiguate(name, "none"))
                dps = healingActor and
                          (healingActor.total / healingActor:Tempo()) or 0
            else -- Look for dps
                local damageActor = combat:GetActor(_G.DETAILS_ATTRIBUTE_DAMAGE,
                                                    Ambiguate(name, "none"))
                dps =
                    damageActor and (damageActor.total / damageActor:Tempo()) or
                        0
            end
        end
        if debugRCScore then EU.Log:D("Details:", dps) end
    end
    if _G.Recount then
        local data = _G.Recount.db2.combatants[Ambiguate(name, "none")]
        if data then
            if role == "HEALER" then
                _, dps = _G.Recount:MergedPetHealingDPS(data, "LastFightData")
            else -- Look for dps
                _, dps = _G.Recount:MergedPetDamageDPS(data, "LastFightData")
            end
        else
            EU.Log:D("No last fight in Recount for", name)
        end
        if debugRCScore then EU.Log:D("Recount:", dps) end
    end
    if _G.Skada then
        -- It seems Skada has no consistency in where its data is stored
        local last
        if _G.Skada.last then -- so far so good
            local guid = UnitGUID(Ambiguate(name, "short"))
            if _G.Skada.last._playeridx then
                last = _G.Skada.last._playeridx[guid]
            else
                for _, data in ipairs(_G.Skada.last.players) do
                    if data.id == guid then
                        last = data
                        break
                    end
                end
            end
        else
            if #_G.Skada.char.sets > 0 then
                for _, data in pairs(_G.Skada.char.sets[1].players) do
                    if addon:UnitIsUnit(data.name, name) then
                        last = data
                        break
                    end
                end
            end
        end
        if last then
            if role == "HEALER" then
                dps = last.healing / last.time or 1
            else -- Look for dps
                dps = last.damage / last.time or 1
            end
        else
            EU.Log:D("No last fight for Skada for ", name)
        end
        if debugRCScore then EU.Log:D("Skada:", dps) end
    end
    return dps
end

function EU.SetCellRCScore(rowFrame, frame, data, cols, row, realrow, column,
                           fShow, table, ...)
    local name = data[realrow].name
    local ilvl = EU.votingFrame:GetCandidateData(session, name, "ilvl")
    -- check if ilvl is availble
    if ilvl and ilvl ~= "" then
        -- Now check if we've already stored the score
        local score = EU.votingFrame:GetCandidateData(1, name, "RCScore")
        if not score then -- Calculate it
            local role = EU.votingFrame:GetCandidateData(session, name, "role")
            local dps = EU.getDPSFromLastFight(role, name)
            if debugRCScore then EU.Log:D("Role, dps:", role, dps) end
            if role == "DAMAGER" or role == "NONE" then
                score = getDPSRCScore2(dps, ilvl)
            elseif role == "TANK" then
                score = getTankRCScore(dps, ilvl)
            elseif role == "HEALER" then
                score = getHealerRCScore(dps, ilvl)
            else
                return EU.Log:D("No valid role in SetCellRCScore", name, role)
            end
            if debugRCScore then EU.Log:D("RCScore:", name, score) end
            -- Store the score
            EU.votingFrame:SetCandidateData(1, name, "RCScore", score)
        end
        data[realrow].cols[column].value = score or 0
        frame.text:SetText(addon.round(score, 0) .. "%")
        frame.text:SetTextColor(unpack(colorGradient[math.ceil(score / 10)] or
                                           {0, 1, 0})) -- >100% is not included in the table, just make it green
    else -- Clear it
        frame.text:SetText("")
        data[realrow].cols[column].value = 0
    end
end

function EU:FixOldOptions()
    if addon.isClassic then return end -- We need them here :P
    -- Remnants of removed columns can cause issues if they're still present in the SV
    self.db.columns.upgrades = nil
    self.db.columns.setPieces = nil
    self.db.columns.ilvlUpgrade = nil
    self.db.columns.traits = nil
    self.db.columns.titanforged = nil
end
