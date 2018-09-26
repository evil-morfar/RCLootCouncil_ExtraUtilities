--io.popen("java -jar LogsParser.jar -dif Normal") -- Fetches new data from WarcraftLogs.com
-- args: -d(debug) -per # (percentile)

require("util/BuildLuaTable")("./output/Uldir_Normal") -- takes directory as argument
require("util/GenerateFunctions")() -- args: debug

-- Cleanup
os.remove("temp_export.lua")
os.remove("content.txt")

-- Consistency tests (how the data has changed) (recorded: 26/9-18, Uldir Normal 99 percentile)
dofile "../../RCScore_Functions.lua"
local t = ExtraUtilities_RCScore_Functions
print(t[2122].HUNTER[255](12972,350) - 103.86309586376)
print(t[2122].HUNTER[255](14390,360) - 101.98729942733)
print(t[2128].PRIEST[256](17755,350) - 98.196761489868)
print(t[2128].PRIEST[256](19569,355) - 100.0940824787)
print(t[2128].PRIEST[256](19856,360) - 94.46166062515)
print(t[2128].PRIEST[256](21055,365) - 93.620509485064)
print(t[2128].PRIEST[256](23000,370) - 95.996158195309)
