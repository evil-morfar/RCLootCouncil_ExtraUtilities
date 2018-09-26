-- Contains the functions used to calculate RCScore
-- Auto generated with data from WarcraftLogs.com
-- Updated on 09/26/18 09:20:47 by Potdisc

_G.ExtraUtilities_RCScore_Functions = {
	[2122] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (162.00820512821 * ilvl + -44213.353846154)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (166.85384615385 * ilvl + -46713.153846154)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (138.05087853323 * ilvl + -35949.991138273)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (99.561538461538 * ilvl + -27190.266153846)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (175.10461229947 * ilvl + -49102.090463458)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (166.55517241379 * ilvl + -46950.048275862)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (159.22085385878 * ilvl + -43902.678981938)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (178.38909899889 * ilvl + -43894.902261772)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (132.97684729064 * ilvl + -34980.803940887)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (180.17570664629 * ilvl + -51533.580595875)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (177.0841025641 * ilvl + -50916.576410256)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (216.54380498534 * ilvl + -64491.603922287)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (189.26693548387 * ilvl + -43478.987903226)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (203.88476084538 * ilvl + -58526.614386355)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (255.74435483871 * ilvl + -69359.181451613)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (181.73081201335 * ilvl + -51596.239525399)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (198.04802052786 * ilvl + -56231.321297654)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (113.17780748663 * ilvl + -32094.693404635)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (132.8189379936 * ilvl + -35009.866997137)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (240.36307692308 * ilvl + -72164.369230769)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (200.49532085561 * ilvl + -57076.303921569)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (171.54344919786 * ilvl + -47180.498217469)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (142.1078817734 * ilvl + -42298.543842365)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (169.7506684492 * ilvl + -47192.268270945)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (203.08024193548 * ilvl + -52814.9375)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (168.960591133 * ilvl + -52065.285714286)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (182.10393162393 * ilvl + -51793.712820513)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (125.44975369458 * ilvl + -36974.833497537)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (187.37536656891 * ilvl + -52684.380315249)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (242.58522727273 * ilvl + -65223.517045455)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (150.66330645161 * ilvl + -41009.054435484)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (246.88427419355 * ilvl + -66800.304435484)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (113.15469208211 * ilvl + -32476.555535191)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (133.03812316716 * ilvl + -33348.802785924)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (186.89032258065 * ilvl + -52932.886021505)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (168.56103372434 * ilvl + -45866.041239003)
			end,
		},
	},
	[2141] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (389.27932998173 * ilvl + -121393.68790318)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (394.36 * ilvl + -124845.28)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (414.37249809015 * ilvl + -131065.85439267)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (264.11275314724 * ilvl + -84149.072523262)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (357.19151069519 * ilvl + -112234.23841355)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (421.27339901478 * ilvl + -134706.71428571)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (367.78133552271 * ilvl + -115422.38067871)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (352.56195773081 * ilvl + -105515.28068224)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (305.97192118227 * ilvl + -94735.956650246)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (325.03269671505 * ilvl + -101765.24461421)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (276.56654456654 * ilvl + -85411.730972731)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (403.37667112299 * ilvl + -128302.03431373)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (386.19274193548 * ilvl + -114382.22983871)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (304.87897664071 * ilvl + -94849.230552466)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (391.51319648094 * ilvl + -119876.12884897)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (323.67389162562 * ilvl + -100544.93694581)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (567.482771261 * ilvl + -184999.25018328)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (242.30715240642 * ilvl + -76532.528074866)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (394.16347826087 * ilvl + -126460.37927536)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (347.84619594964 * ilvl + -109015.77312534)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (397.26938502674 * ilvl + -124978.32531194)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (449 * ilvl + -143212)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (296.60133481646 * ilvl + -95481.006525769)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (393.02573529412 * ilvl + -124127.76782531)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (315.19072580645 * ilvl + -94061.997983871)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (261.16462736374 * ilvl + -83621.960400445)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (382.23452991453 * ilvl + -119428.59487179)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (178.05665024631 * ilvl + -55277.812807882)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (325.54453812317 * ilvl + -101701.98955279)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (432.57903225806 * ilvl + -132712.36290323)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (407.33592880979 * ilvl + -127980.08676307)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (366.07177419355 * ilvl + -109238.86693548)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (221.80021994135 * ilvl + -69262.22818915)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (346.00846774194 * ilvl + -107192.42540323)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (408.82298387097 * ilvl + -128025.09475806)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (406.44849706745 * ilvl + -127880.09695748)
			end,
		},
	},
	[2135] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (175.38222222222 * ilvl + -50324.733333333)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (188.20717948718 * ilvl + -55615.646153846)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (163.78792971734 * ilvl + -46607.102826585)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (118.25911330049 * ilvl + -35486.243349754)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (198.25868983957 * ilvl + -58730.457219251)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (168.47487684729 * ilvl + -48683.278817734)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (165.16064310834 * ilvl + -47715.631820461)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (295.35846774194 * ilvl + -86229.901209677)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (174.51280788177 * ilvl + -50861.189162562)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (174.70466004584 * ilvl + -51152.27012987)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (186.50976800977 * ilvl + -55772.503663004)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (218.94813049853 * ilvl + -66438.404142229)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (340.88790322581 * ilvl + -97085.495967742)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (229.38669354839 * ilvl + -69217.856854839)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (342.42822580645 * ilvl + -99534.568548387)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (172.13681868743 * ilvl + -50464.668891361)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (218.77291055718 * ilvl + -65999.550953079)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (104.81483957219 * ilvl + -30286.507130125)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (164.98538461538 * ilvl + -47856.295384615)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (234.61233211233 * ilvl + -71616.486568987)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (239.5320855615 * ilvl + -71779.392156863)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (193.52740641711 * ilvl + -56629.453654189)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (157.00725806452 * ilvl + -48811.157258065)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (178.51804812834 * ilvl + -52036.152406417)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (261.76924486804 * ilvl + -74611.747800586)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (145.30611790879 * ilvl + -44805.118798665)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (187.94735042735 * ilvl + -55471.287179487)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (137.90295566502 * ilvl + -42747.266995074)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (216.7008797654 * ilvl + -64631.850256598)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (285.19959677419 * ilvl + -80687.175403226)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (196.25205784205 * ilvl + -57996.387838339)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (240.32298387097 * ilvl + -64638.885080645)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (114.89919354839 * ilvl + -34002.163306452)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (172.78467741935 * ilvl + -49257.302419355)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (166.19758064516 * ilvl + -46958.883064516)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (196.06524926686 * ilvl + -57282.258614369)
			end,
		},
	},
	[2136] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (238.27194465452 * ilvl + -69451.784312848)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (281.16025839794 * ilvl + -85522.035710597)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (225.21176470588 * ilvl + -65390.376470588)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (200.95840175151 * ilvl + -61856.795019157)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (298.50679908327 * ilvl + -89405.938579068)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (256.4362625139 * ilvl + -75995.088394512)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (265.31034482759 * ilvl + -79432.706896552)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (340.83426028921 * ilvl + -100095.27860586)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (236.29014778325 * ilvl + -69402.298522167)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (251.41400560224 * ilvl + -74484)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (248.47252747253 * ilvl + -74603.098494098)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (306.7353372434 * ilvl + -94384.224890029)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (401.80161290323 * ilvl + -117235.95967742)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (214.87634892089 * ilvl + -62149.616007205)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (370.1578822224 * ilvl + -108139.88206388)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (216.2275862069 * ilvl + -62439.875862069)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (299.66184017595 * ilvl + -90638.127932551)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (156.33389037433 * ilvl + -46729.834670232)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (252.24547008547 * ilvl + -74790.143589744)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (301.49397920088 * ilvl + -92432.800218938)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (300.53353705118 * ilvl + -91134.9118411)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (241.98362299465 * ilvl + -69663.684937611)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (219.88467741935 * ilvl + -68695.060483871)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (229.32252673797 * ilvl + -67265.486185383)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (313.98185483871 * ilvl + -92200.945564516)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (192.44649610679 * ilvl + -59774.116203189)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (279.37435897436 * ilvl + -84554)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (181.14630541872 * ilvl + -56250.412807882)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (245.32166422287 * ilvl + -72788.820381232)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (349.74211876833 * ilvl + -101885.54197214)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (250.4255839822 * ilvl + -73624.369521691)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (362.69596774194 * ilvl + -106202.06854839)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (146.05681818182 * ilvl + -43363.011363636)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (233.32496334311 * ilvl + -66606.430718475)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (229.56209677419 * ilvl + -66026.092741935)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (243.85410557185 * ilvl + -71377.322030792)
			end,
		},
	},
	[2144] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (143.57094017094 * ilvl + -39057.641025641)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (176.75692307692 * ilvl + -50899.556923077)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (139.59993315508 * ilvl + -37979.364081996)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (123.30979748221 * ilvl + -37211.156267105)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (146.31851604278 * ilvl + -40692.209893048)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (152.36040044494 * ilvl + -43362.361957731)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (156.00930487137 * ilvl + -44638.646414888)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (334.43804226919 * ilvl + -103249.11931776)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (157.35812807882 * ilvl + -44725.984236453)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (148.0925802139 * ilvl + -41754.776737968)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (150.58495726496 * ilvl + -42750.851282051)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (198.42914438503 * ilvl + -58723.957219251)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (367.25524193548 * ilvl + -113262.35282258)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (142.88275862069 * ilvl + -39613.071264368)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (311.94519794721 * ilvl + -94804.674120235)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (133.08275862069 * ilvl + -36952.848275862)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (183.7598973607 * ilvl + -53879.26851173)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (107.55548128342 * ilvl + -31733.93315508)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (132.19739130435 * ilvl + -36545.216376812)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (183.10239355785 * ilvl + -53582.630199755)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (161.30614973262 * ilvl + -45295.625668449)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (147.85728609626 * ilvl + -41053.921122995)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (138.27630700779 * ilvl + -42561.15083426)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (163.80314171123 * ilvl + -46759.706327986)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (289.39758064516 * ilvl + -86740.592741935)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (153.7276974416 * ilvl + -47832.602076381)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (174.91418803419 * ilvl + -50861.78974359)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (114.85418719212 * ilvl + -34924.002955665)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (146.85025659824 * ilvl + -40879.609970674)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (275.12738269795 * ilvl + -82672.12829912)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (160.4213570634 * ilvl + -45368.971078977)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (312.37258064516 * ilvl + -93252.814516129)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (102.20674486804 * ilvl + -30013.185300587)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (138.46290322581 * ilvl + -37921.10483871)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (150.42943548387 * ilvl + -41683.578629032)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (159.86198680352 * ilvl + -45091.780058651)
			end,
		},
	},
	[2145] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (211.83645504291 * ilvl + -59666.96627663)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (205.28384615385 * ilvl + -58957.433846154)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (246.29045072574 * ilvl + -72088.81038961)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (203.78352490421 * ilvl + -61417.368910783)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (321.05648395722 * ilvl + -95699.411319073)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (259.48325123153 * ilvl + -76417.450246305)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (279.32213570634 * ilvl + -83792.997107898)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (215.96529477197 * ilvl + -59236.830329996)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (264.07586206897 * ilvl + -77898.579310345)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (251.69159663866 * ilvl + -73478.814285714)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (261.52564102564 * ilvl + -78830.773504274)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (282.91612903226 * ilvl + -85031.193548387)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (246.29879032258 * ilvl + -67855.038306452)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (230.32223792398 * ilvl + -67166.533890042)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (235.35286857868 * ilvl + -66020.862056862)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (222.94282536151 * ilvl + -63789.831590656)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (311.392228739 * ilvl + -94002.187316716)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (155.47159090909 * ilvl + -46246.795454545)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (235.41 * ilvl + -68355.28)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (296.39408866995 * ilvl + -89297.162561576)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (276.41772345302 * ilvl + -82116.447822765)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (293.25534759358 * ilvl + -86783.631016043)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (197.42983870968 * ilvl + -59876.012096774)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (252.77172459893 * ilvl + -74663.461229947)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (254.92217741935 * ilvl + -72528.889112903)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (224.71879866518 * ilvl + -70526.380793474)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (232.19008547009 * ilvl + -68370.774358974)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (146.47142857143 * ilvl + -43482.713300493)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (209.37701612903 * ilvl + -59707.810483871)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (213.97140762463 * ilvl + -58021.835410557)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (263.73225806452 * ilvl + -78471.048387097)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (217.95806451613 * ilvl + -58190.338709677)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (133.97030791789 * ilvl + -39040.131964809)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (243.94519794721 * ilvl + -69554.986620235)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (240.4935483871 * ilvl + -69536.048387097)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (263.24230205279 * ilvl + -77540.638379765)
			end,
		},
	},
	[2134] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (190.69293924466 * ilvl + -54976.096880131)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (206.33461538462 * ilvl + -61989.864615385)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (187.93873185638 * ilvl + -54774.363789152)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (167.79666119321 * ilvl + -51766.941160372)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (235.92498090145 * ilvl + -70339.990985485)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (209.58709677419 * ilvl + -62636.959139785)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (217.66119321292 * ilvl + -64684.231800766)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (377.80889877642 * ilvl + -112082.55461624)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (195.85714285714 * ilvl + -57683.669950739)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (207.13417366947 * ilvl + -61287.557142857)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (195.61294261294 * ilvl + -57962.442816443)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (250.98258797654 * ilvl + -76631.21627566)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (459.06169354839 * ilvl + -137889.6108871)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (184.79754624875 * ilvl + -53948.767548829)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (354.49413489736 * ilvl + -103814.53995601)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (200.55350389321 * ilvl + -59488.217130145)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (261.40395894428 * ilvl + -78998.419904692)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (135.4361631016 * ilvl + -40766.213458111)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (214.26230769231 * ilvl + -64018.652307692)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (266.19852216749 * ilvl + -81293.759605911)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (240.82219251337 * ilvl + -72445.609625668)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (196.82553475936 * ilvl + -56838.557040998)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (161.66290322581 * ilvl + -49525.10483871)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (197.60795454545 * ilvl + -58374.28030303)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (352.07298387097 * ilvl + -103086.3608871)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (196.98576195773 * ilvl + -61922.819280682)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (226.29230769231 * ilvl + -68681.923076923)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (138.77980295567 * ilvl + -42854.084729064)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (196.16880498534 * ilvl + -57557.103922287)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (353.39754398827 * ilvl + -103004.98313783)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (223.69855394883 * ilvl + -66564.037374861)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (376.34959677419 * ilvl + -110114.42943548)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (122.54618768328 * ilvl + -36370.044721408)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (192.61143695015 * ilvl + -55830.365835777)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (195.17620967742 * ilvl + -57076.360887097)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (236.0758797654 * ilvl + -70770.662756598)
			end,
		},
	},
	[2128] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (279.51043288693 * ilvl + -80954.05356586)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (336.21692307692 * ilvl + -101985.39692308)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (294.9486631016 * ilvl + -87662.051336898)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (217.06157635468 * ilvl + -66953.445812808)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (318.36317799847 * ilvl + -95508.325897632)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (266.30344827586 * ilvl + -77949.572413793)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (314.69731800766 * ilvl + -94330.216201423)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (298.32747497219 * ilvl + -88634.756544309)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (353.86354679803 * ilvl + -108285.66108374)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (298.33659281895 * ilvl + -89308.965928189)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (286.05494505495 * ilvl + -85330.321530322)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (427.09959893048 * ilvl + -132416.39661319)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (370.81935483871 * ilvl + -111350.58064516)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (278.9560483871 * ilvl + -82519.558467742)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (293.91239002933 * ilvl + -84788.292155425)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (284.0318131257 * ilvl + -83807.044419726)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (440.50623167155 * ilvl + -138070.52785924)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (214.85060160428 * ilvl + -66366.783868093)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (281.40538461538 * ilvl + -83566.495384615)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (431.75697865353 * ilvl + -134965.59195402)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (405.375 * ilvl + -124335.92424242)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (360.21423796791 * ilvl + -109245.9959893)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (229.71572580645 * ilvl + -71438.405241935)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (334.51437165775 * ilvl + -101109.3587344)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (357.06491935484 * ilvl + -107096.69153226)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (269.00289210234 * ilvl + -84878.391916945)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (395.91282051282 * ilvl + -122269.84615385)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (198.99261083744 * ilvl + -61845.280788177)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (432.27291055718 * ilvl + -135427.55095308)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (366.25846774194 * ilvl + -111051.49798387)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (350.49454949944 * ilvl + -106096.81779755)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (293.79233870968 * ilvl + -84022.66733871)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (167.25018328446 * ilvl + -49584.158907625)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (257.96290322581 * ilvl + -74456.024193548)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (333.43225806452 * ilvl + -98927.709677419)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (378.83121657754 * ilvl + -115325.45855615)
			end,
		},
	},
}