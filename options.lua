local addon = LibStub("AceAddon-3.0"):GetAddon("RCLootCouncil")
local EU = addon:GetModule("RCExtraUtilities")
local L = LibStub("AceLocale-3.0"):GetLocale("RCLootCouncil")
local LE = LibStub("AceLocale-3.0"):GetLocale("RCExtraUtilities")

------ Options ------
function EU:OptionsTable()
   local addon_db = addon:Getdb()
   local options = {
      name = "Extra Utilities",
      order = 1,
      type = "group",
      childGroups = "tab",
      args = {
         desc = {
            name = format(LE["extra_util_desc"], self.version),
            order = 1,
            type = "description",
         },
         general = {
            name = L.General,
            order = 1,
            type = "group",
            args = {
               columns = {
                  name = LE["Extra Utilities Columns"],
                  order = 2,
                  type = "group",
                  inline = true,
                  handler = EU,
                  set = "ColSet",
                  get = "ColGet",
                  args = {
                     pawn = {
                        name = "Pawn",
                        order = 1,
                        type = "toggle",
                        desc = LE["opt_pawn_desc"],
                        disabled = true,
                        set = function(info, val)
                           if PawnVersion then
                              self:ColSet(info,val)
                           else
                              addon:Print(LE["opt_pawn_warning"])
                           end
                        end,
                     },
                     traits = {
                        name = LE["Artifact Traits"],
                        order = 2,
                        type = "toggle",
                        desc = LE["opt_traits_desc"],
                     },
                     upgrades = {
                        name = LE["Upgrades"],
                        order = 3,
                        type = "toggle",
                        desc = LE["opt_upgrades_desc"],
                     },
                     sockets = {
                        name = LE["Sockets"],
                        order = 4,
                        type = "toggle",
                        desc = LE["opt_sockets_desc"],
                     },
                     --[[setPieces = {
                        name = LE["Set Pieces"],
                        order = 5,
                        type = "toggle",
                        desc = LE["opt_setpieces_desc"],
                     },]]
                     titanforged = {
                        name = LE["Forged"],
                        order = 6,
                        type = "toggle",
                        desc = LE["opt_forged_desc"],
                     },
                     legendaries = {
                        name = LE["Legendaries"],
                        order = 7,
                        type = "toggle",
                        desc = LE["opt_legendaries_desc"],
                     },
                     ilvlUpgrade = {
                        name = LE["ilvl Upgrades"],
                        order = 8,
                        type = "toggle",
                        desc = LE["opt_ilvlupgrades_desc"],
                     },
                  },
               },
               normalColumns = {
                  name = LE["RCLootCouncil Columns"],
                  order = 2,
                  type = "group",
                  inline = true,
                  args = {}, -- Created further down
               },
               otherOptions = {
                  name = LE["Other"],
                  order = 3,
                  type = "group",
                  inline = true,
                  args = {
                     decimals = {
                        name = LE["ilvl Decimals"],
                        order = 1,
                        type = "toggle",
                        desc = LE["opt_ilvldecimals_desc"],
                        get = function() return addon_db.iLvlDecimal end,
                        set = function(_, val) addon_db.iLvlDecimal = val end,
                     },
                  },
               }
            },
         },
      },
   }
   -- Create the normalColumns
   local i = 0
   for name, v in pairs(self.db.normalColumns) do
      i = i + 1
      options.args.general.args.normalColumns.args[name] = {
         order = i,
         name = v.name,
         type = "toggle",
         desc = format(LE["opt_normalcolumn_desc"], v.name),
         set = function()
            if self.votingFrame.frame and self.votingFrame.frame:IsVisible() then return addon:Print(LE["You can't change these settings while the voting frame is showing."]) end
            self.db.normalColumns[name].enabled = not self.db.normalColumns[name].enabled
            self:UpdateColumn(name, self.db.normalColumns[name].enabled)
         end,
         get = function() return self.db.normalColumns[name].enabled end
      }
   end


   LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("RCLootCouncil - Extra Utilities", options)
   LibStub("AceConfigDialog-3.0"):AddToBlizOptions("RCLootCouncil - Extra Utilities", "Extra Utilities", "RCLootCouncil")
end

function EU:ColSet(info, val)
   if self.votingFrame.frame and self.votingFrame.frame:IsVisible() then return addon:Print(LE["You can't change these settings while the voting frame is showing."]) end
   self.db.columns[info[#info]].enabled = val
   self:UpdateColumn(info[#info], val)
end
function EU:ColGet(info)
   return self.db.columns[info[#info]].enabled
end
