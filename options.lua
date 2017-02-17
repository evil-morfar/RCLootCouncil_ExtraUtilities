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
                     spec = {
                        name = LE["Spec Icon"],
                        order = 9,
                        type = "toggle",
                        desc = LE["opt_specIcon_desc"],
                     },
                     bonus = {
                        name = LE["Bonus Rolls"],
                        order = 10,
                        type = "toggle",
                        desc = LE["opt_bonusRoll_desc"],
                     },
                     guildNotes = {
                        name = LE["Guild Notes"],
                        order = 11,
                        type = "toggle",
                        desc = LE["opt_guildNotes_desc"],
                     },
                     header = {
                        order = -1,
                        name = "",
                        type = "header",
                     },
                     reset = {
                        name = L["Reset to default"],
                        order = -1,
                        --width = "full",
                        type = "execute",
                        confirm = true,
                        func = function()
                           if self.votingFrame.frame and self.votingFrame.frame:IsVisible() then return addon:Print(LE["You can't change these settings while the voting frame is showing."]) end
                           for k in pairs(self.db.columns) do
                              self.db.columns[k] = self.defaults.profile.columns[k]
                              -- Now apply the changes
                              self:UpdateColumn(k, self.db.columns[k].enabled)
                           end
                        end,
                     },
                  },
               },
               normalColumns = {
                  name = LE["RCLootCouncil Columns"],
                  order = 3,
                  type = "group",
                  inline = true,
                  args = {
                     -- Created further down
                     header = {
                        name = "",
                        order = -1,
                        type = "header",
                     },
                     reset = {
                        name = L["Reset to default"],
                        order = -1,
                        --width = "full",
                        type = "execute",
                        confirm = true,
                        func = function()
                           if self.votingFrame.frame and self.votingFrame.frame:IsVisible() then return addon:Print(LE["You can't change these settings while the voting frame is showing."]) end
                           for k in pairs(self.db.normalColumns) do
                              self.db.normalColumns[k] = self.defaults.profile.normalColumns[k]
                              -- Now apply the changes
                              self:UpdateColumn(k, self.db.normalColumns[k].enabled)
                           end
                        end,
                     },
                  },
               },

               otherOptions = {
                  name = LE["Other"],
                  order = 5,
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
         pawnOptions = {
            order = 2,
            type = "group",
            name = "Pawn",
            desc = LE["Pawn specific options"],
            disabled = function() return not PawnVersion end,
            childGroups = "tab",
            args = {
               scalesGroup = {
                  order = 2,
                  type = "group",
                  --inline = true,
                  name = LE["Scales"],
                  childGroups = "tree",
                  args = {
                     desc = {
                        name = LE["opt_scalesGroup_desc"],
                        type = "description",
                        order = 0,
                     },
                  },
               },
            },
         },
         widthOptions = {
            order = 3,
            type = "group",
            name = "Widths",
            args = {
               columns = {
                  order = 1,
                  name = LE["Extra Utilities Columns"],
                  type = "group",
                  inline = true,
                  args = {
                     -- Made further down
                  },
               },
               normalColumns = {
                  order = 2,
                  name = LE["RCLootCouncil Columns"],
                  type = "group",
                  inline = true,
                  args = {
                     -- Made further down
                  },
               },
            },
         },
      },
   }
   -- Create the normalColumns
   local i = 0
   for name, v in pairs(self.db.normalColumns) do
      i = i + 1
      -- Enabledness
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
      -- Position
      options.args.widthOptions.args.normalColumns.args[name.."Pos"] = {
         order = i,
         name = v.name,
         desc = "coming soon",
         type = "input",
         pattern = "%d",
         get = function() return tostring(self.db.normalColumns[name].pos or self:GetScrollColIndexFromName(name)) end,
         set = function(info, txt)
            self.db.normalColumns[name].pos = tonumber(txt)
            self:UpdateColumnPosition(name, tonumber(txt))
         end,
      }
      -- Width
      options.args.widthOptions.args.normalColumns.args[name.."Width"] = {
         order = i + 0.1,
         name = v.name,
         desc = format(LE["column_width_desc"], v.name),
         type = "range",
         width = "double",
         min = 10,
         max = 300,
         step = 1,
         get = function() return v.width or self.originalCols[name].width end,
         set = function(_, val)
            self.db.normalColumns[name].width = val
            self:UpdateColumnWidth(name, val)
         end,
      }
   end
   -- Create width slider for the EU cols
   i = 0
   for name, v in pairs(self.db.columns) do
      i = i + 1 * 2
      options.args.widthOptions.args.columns.args[name.."Pos"] = {
         order = i,
         name = name == "spec" and "Spec" or v.name, -- Special case with spec
         desc = "coming soon",
         type = "input",
         pattern = "%d",
         get = function() return tostring(self.db.columns[name].pos) end,
         set = function(info, txt)
            self.db.columns[name].pos = tonumber(txt)
            self:UpdateColumnPosition(name, tonumber(txt))
         end,
      }
      options.args.widthOptions.args.columns.args[name.."Width"] = {
         order = i + 1,
         name = name == "spec" and "Spec" or v.name, -- Special case with spec
         desc = format(LE["column_width_desc"], v.name),
         type = "range",
         width = "double",
         min = 10,
         max = 300,
         step = 1,
         get = function() return v.width end,
         set = function(_, val)
            self.db.columns[name].width = val
            self:UpdateColumnWidth(name, val)
         end,
      }
   end

   options = self:CreatePawnScaleOptions(options)

   LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("RCLootCouncil - Extra Utilities", options)
   self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("RCLootCouncil - Extra Utilities", "Extra Utilities", "RCLootCouncil")
end

function EU:ColSet(info, val)
   if self.votingFrame.frame and self.votingFrame.frame:IsVisible() then return addon:Print(LE["You can't change these settings while the voting frame is showing."]) end
   self.db.columns[info[#info]].enabled = val
   self:UpdateColumn(info[#info], val)
end
function EU:ColGet(info)
   return self.db.columns[info[#info]].enabled
end

-- Seperate Pawn scales for sanity
function EU:CreatePawnScaleOptions(options)
   if not PawnVersion then return options end -- Just in case
   local scales = {}
   for k in pairs(PawnCommon.Scales) do
      scales[k] = k
   end
   local i = 1
   for class, opt in pairs(self.db.pawn) do
      local c = addon:GetClassColor(class)
      local hex = "|cFF"..addon:RGBToHex(c.r,c.g,c.b)
      options.args.pawnOptions.args.scalesGroup.args[class] = {
         order = i,
         type = "group",
         name = hex..LOCALIZED_CLASS_NAMES_MALE[class],
         args = {},
      }
      local j = 0
      for specID, scale in pairs(opt) do
         local _, name, description, icon = GetSpecializationInfoByID(specID)
         options.args.pawnOptions.args.scalesGroup.args[class].args[""..specID] = {
            order = j * 2 + 1,
            name = hex..name,
            type = "description",
            fontSize = "large",
            image = icon,
            imageWidth = 26,
            imageHeight = 26,
         }
         options.args.pawnOptions.args.scalesGroup.args[class].args[specID.."scale"] = {
            order = j * 2 + 2,
            type = "select",
            name = "",
            style = "dropdown",
            width = "full",
            values = scales,
            get = function() return self.db.pawn[class][specID] end,
            set = function(info, key) self.db.pawn[class][specID] = key end,
         }
         j = j + 1
      end
      i = i + 1
   end




   return options
end
