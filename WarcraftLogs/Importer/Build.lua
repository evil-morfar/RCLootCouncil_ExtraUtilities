--io.popen("java -jar LogsParser.jar -dif Heroic") -- Fetches new data from WarcraftLogs.com
-- args: -d(debug) -per # (percentile)

require("util/BuildLuaTable")("./output/Uldir_Heroic") -- takes directory as argument
require("util/GenerateFunctions")(true) -- args: debug

-- Cleanup
os.remove("temp_export.lua")
os.remove("content.txt")

-- Consistency tests (how the data has changed) (recorded: 24/10-18, Uldir Heroic 99 percentile)
dofile "../../RCScore_Functions.lua"
local t = ExtraUtilities_RCScore_Functions
print(t[2122].HUNTER[255](12972,350) - 112.12332589287)
print(t[2122].HUNTER[255](14390,360) - 104.43494890489)
print(t[2128].PRIEST[256](17755,350) - 87.806162179652)
print(t[2128].PRIEST[256](24105,355) - 107.64814804132)
print(t[2128].PRIEST[256](22758,360) - 92.647338770405)
print(t[2128].PRIEST[256](24758,365) - 92.602303068601)
print(t[2128].PRIEST[256](27688,370) - 95.781186048787)
