-- Translate RCLootCouncil - ExtraUtilities to your language at:
-- http://wow.curseforge.com/addons/rclootcouncil-extrautilities/localization/

-- Default english translation
local L = LibStub("AceLocale-3.0"):NewLocale("RCExtraUtilities", "enUS", true)
if not L then return end


L["Artifact Traits"] = true
L["Class"] = true
L["extra_util_desc"] = "These are the individual settings for RCLootCouncil - Extra Utilities |cFF87CEFAv %s |r.\n"..
      "Note: these settings are not shared with the group, so each council member can have different settings."
L["Extra Utilities Columns"] = true
L["Forged"] = true
L["ilvl Decimals"] = true
L["ilvl Upg."] = true
L["ilvl Upgrades"] = true
L["Legendaries"] = true
L["Other"] = true
L["RCLootCouncil Columns"] = true
L["Set Pieces"] = true
L["Sockets"] = true
L["Traits"] = true
L["Upgrades"] = true
L["You can't change these settings while the voting frame is showing."] = true

L["opt_pawn_desc"] = "Enables a Pawn column, showing upgrade statistics for the candidate."
L["opt_traits_desc"] = "Enables a column showing the number of artifact traits a candidate has."
L["opt_upgrades_desc"] = "Enables a column showing x of y valor upgrades a candidate has performed."
L["opt_sockets_desc"] = "Enables a column showing how many sockets a candidate has on his/her equipped gear."
L["opt_setpieces_desc"] = "Enables a column showing the number of set pieces the candidate has equipped."
L["opt_forged_desc"] = "Enables a column showing how many Titan-/Warforged items the cancidate has equipped."
L["opt_legendaries_desc"] = "Enables a column showing how many legendaries the candidate has equipped."
L["opt_ilvlupgrades_desc"] = "Enables a column showing the total ilvls a candidate have optained through item upgrades. It's basicly the 'Upgrade' option put into actual ilvls."
L["opt_normalcolumn_desc"] = "Enables the %s column from RCLootCouncil."
L["opt_pawn_warning"] = "You cannot activate Pawn column with having installed Pawn."
L["opt_ilvldecimals_desc"] = "Check to show a more accurate ilvl in the ilvl column."
