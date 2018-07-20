--io.popen("java -jar LogsParser.jar") -- Fetches new data from WarcraftLogs.com
-- args: -d(debug) -per # (percentile)

require("util/BuildLuaTable")("./output/Antorus_Heroic") -- takes directory as argument
require("util/GenerateFunctions")() -- args: debug

-- Cleanup
os.remove("temp_export.lua")
os.remove("content.txt")

-- Consistency tests (how the data has changed) (recorded: 14/3-18)
dofile "../../RCScore_Functions.lua"
local t = ExtraUtilities_RCScore_Functions
print(t[2064].HUNTER[255](1500000,930) - 150.55747030351)
print(t[2064].HUNTER[255](1500000,970) - 71.145883035135)
print(t[2064].PRIEST[258](1500000,930) - 130.94999645369)
print(t[2064].PRIEST[258](1500000,970) - 63.572262428632)
print(t[2073].PRIEST[258](1500000,930) - 123.54418677691)
print(t[2073].PRIEST[258](1500000,970) - 45.413256194762)
print(t[2076].PRIEST[258](500000,820))
