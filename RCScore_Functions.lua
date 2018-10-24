-- Contains the functions used to calculate RCScore
-- Auto generated with data from WarcraftLogs.com
-- Updated on 10/24/18 17:13:40 by Potdisc

_G.ExtraUtilities_RCScore_Functions = {
	[2122] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (220.95087719298 * ilvl + -65763.403508772)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (304.46617647059 * ilvl + -96425.564705882)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (239.92145721925 * ilvl + -72716.550802139)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (363.71323529412 * ilvl + -124788.67647059)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (325.82298387097 * ilvl + -104007.11612903)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (286.75988142292 * ilvl + -90252.373517787)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (263.47142857143 * ilvl + -81258.671428571)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (343.50793650794 * ilvl + -105075.43915344)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (232.44043478261 * ilvl + -70396.532318841)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (239.23387096774 * ilvl + -73071.580645161)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (354.80153846154 * ilvl + -115043.33230769)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (292.08300395257 * ilvl + -92632.055335968)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (370.67185761958 * ilvl + -111383.17434186)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (285.30427350427 * ilvl + -88076.278632479)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (475.584876905 * ilvl + -149300.55803047)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (281.34060150376 * ilvl + -87833.542857143)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (370.81461538462 * ilvl + -118413.59307692)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (177.96459096459 * ilvl + -55980.676434676)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (273.69122807018 * ilvl + -85735.18245614)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (372.54495726496 * ilvl + -119925.42564103)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (298.73091773093 * ilvl + -91922.216067721)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (242.52573529412 * ilvl + -73619.934269162)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (212.64025974026 * ilvl + -68560.203030303)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (297.80979748221 * ilvl + -94071.946086481)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (318.82709359606 * ilvl + -94940.508374384)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (282.38831168831 * ilvl + -94344.532467532)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (322.26617647059 * ilvl + -102476.16470588)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (209.29264909842 * ilvl + -67896.461858509)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (250.62518328446 * ilvl + -75452.598790323)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (375.47980295567 * ilvl + -114589.70541872)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (270.06227106227 * ilvl + -83927.434269434)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (326.60333704116 * ilvl + -97056.459695958)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (152.84136752137 * ilvl + -47346.303589744)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (294.27913043478 * ilvl + -92435.472028986)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (283.71530768661 * ilvl + -88477.535732505)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (307.86108374384 * ilvl + -96691.292610837)
			end,
		},
	},
	[2141] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (300.89371657754 * ilvl + -91522.585561497)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (264.98149752597 * ilvl + -80397.077937588)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (240.97773079634 * ilvl + -70884.495137421)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (246.51871921182 * ilvl + -79842.918719212)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (229.6289640592 * ilvl + -68393.289640592)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (308.6568552358 * ilvl + -96667.399496663)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (296.51116035733 * ilvl + -91803.613122848)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (427.08953893526 * ilvl + -133902.20735759)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (219.05684803002 * ilvl + -65440.250562852)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (212.03093727977 * ilvl + -62930.524735729)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (278.20288547213 * ilvl + -86310.656941816)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (288.70823287841 * ilvl + -89748.632242979)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (455.48344947735 * ilvl + -142565.27700348)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (257.06463414634 * ilvl + -79119.641463415)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (450.26740134511 * ilvl + -142970.09415769)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (252.08416311048 * ilvl + -76300.713371266)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (291.66923076923 * ilvl + -89339.876923077)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (161.51422088972 * ilvl + -49074.928882046)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (215.92666157372 * ilvl + -64648.870893812)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (237.8561111719 * ilvl + -71065.957872853)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (308.02579281184 * ilvl + -95062.142283298)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (234.13560857747 * ilvl + -69174.861673211)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (230.37731092437 * ilvl + -74255.169747899)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (292.43685694151 * ilvl + -90111.401057082)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (341.69661663935 * ilvl + -104922.5960433)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (218.44125286478 * ilvl + -69998.689533995)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (352.82943548387 * ilvl + -111148.02056452)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (195.44032258065 * ilvl + -62724.620967742)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (228.83227625088 * ilvl + -69337.822410148)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (380.21221943116 * ilvl + -117462.29081922)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (308.45168855535 * ilvl + -94946.210412758)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (381.71639251276 * ilvl + -116550.18807228)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (178.37510121457 * ilvl + -55076.571997301)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (251.52101313321 * ilvl + -75117.346247655)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (377.94068560666 * ilvl + -120167.83560065)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (279.23195409242 * ilvl + -84806.921473875)
			end,
		},
	},
	[2135] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (240.76826086957 * ilvl + -73868.960869565)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (245.32481203008 * ilvl + -76488.893233083)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (175.73257467994 * ilvl + -50966.687055477)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (225.28831168831 * ilvl + -74654.625108225)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (240.48693659282 * ilvl + -74436.550496562)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (284.72925932347 * ilvl + -90834.7267564)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (240.57264957265 * ilvl + -74691.717948718)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (363.91330645161 * ilvl + -111620.91532258)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (251.33524904215 * ilvl + -78731.882594417)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (206.4472955262 * ilvl + -62862.640756618)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (282.15654077723 * ilvl + -90147.770388615)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (269.59802955665 * ilvl + -85550.24729064)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (382.09472329472 * ilvl + -112645.56580867)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (314.9939516129 * ilvl + -100074.20564516)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (461.06490423143 * ilvl + -142706.48455281)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (253.12991452991 * ilvl + -79952.743589744)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (262.55283648498 * ilvl + -82246.24790508)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (153.67467008798 * ilvl + -48657.597507331)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (236.34384615385 * ilvl + -73641.135384615)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (314.58588709677 * ilvl + -100776.40241935)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (306.02626641651 * ilvl + -96123.147842401)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (227.67902187902 * ilvl + -69114.17014157)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (254.43675889328 * ilvl + -85495.774703557)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (220.32727272727 * ilvl + -67563.886631016)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (302.19986631016 * ilvl + -88913.30258467)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (225.46974358974 * ilvl + -74875.331282051)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (245.40827067669 * ilvl + -76025.489473684)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (193.395256917 * ilvl + -63851.138339921)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (273.14285714286 * ilvl + -85466.857142857)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (373.98135981665 * ilvl + -113172.83407181)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (238.22836137643 * ilvl + -73643.71384722)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (324.90896358543 * ilvl + -94593.743137255)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (141.22741935484 * ilvl + -43999.980645161)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (257.32561576355 * ilvl + -80381.880295567)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (321.48418972332 * ilvl + -104136.57312253)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (262.76102941176 * ilvl + -82022.506461676)
			end,
		},
	},
	[2136] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (301.58064516129 * ilvl + -92868.492473118)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (266.28608695652 * ilvl + -81427.100869565)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (217.40452961672 * ilvl + -63240.893031359)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (287.51 * ilvl + -94146.44)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (296.89372469636 * ilvl + -89933.57219973)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (308.52401026393 * ilvl + -95571.619501466)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (295.89927015984 * ilvl + -91267.249533931)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (364.60012870013 * ilvl + -108616.73011583)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (298.67486631016 * ilvl + -92781.429946524)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (233.63228631833 * ilvl + -69160.003926306)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (318.69462729052 * ilvl + -100371.79576588)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (325.12199197861 * ilvl + -102861.46724599)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (477.80688259109 * ilvl + -144655.35991903)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (267.80141570142 * ilvl + -81442.643800944)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (435.95668016194 * ilvl + -131095.12901484)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (243.38387096774 * ilvl + -73010.177419355)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (308.30866069216 * ilvl + -94633.439587694)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (161.04907539118 * ilvl + -49324.885490754)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (267.21045606229 * ilvl + -81002.13214683)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (331.62605042017 * ilvl + -104379.25378151)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (308.87360314105 * ilvl + -95305.128057989)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (237.83358348968 * ilvl + -69198.074015009)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (209.60640394089 * ilvl + -66499.92955665)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (260.07955465587 * ilvl + -79378.111740891)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (333.83989597278 * ilvl + -99680.040189503)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (232.99977753059 * ilvl + -75749.352020764)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (275.46134366925 * ilvl + -84018.449715763)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (206.36548471774 * ilvl + -66619.600836421)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (245.00609756098 * ilvl + -73658.62804878)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (404.79921216763 * ilvl + -122043.3557282)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (289.82139037433 * ilvl + -88511.51657754)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (429.15465587045 * ilvl + -130164.88367072)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (151.11545756283 * ilvl + -45744.087956377)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (271.60707850708 * ilvl + -81418.145259545)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (358.82304241518 * ilvl + -114752.07832266)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (282.91923076923 * ilvl + -86599.603846154)
			end,
		},
	},
	[2144] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (228.71871657754 * ilvl + -69444.371122995)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (173.60622914349 * ilvl + -49573.86429366)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (152.56631430585 * ilvl + -42399.358985201)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (158.47185761958 * ilvl + -50379.625435669)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (172.43072586328 * ilvl + -49839.707399577)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (190.19149797571 * ilvl + -56594.963292848)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (190.61461926847 * ilvl + -56892.326586099)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (321.87902114902 * ilvl + -98770.744267077)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (174.15975609756 * ilvl + -50692.026829268)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (155.82713178295 * ilvl + -44482.394503171)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (196.76687609433 * ilvl + -58718.866824588)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (216.94303135889 * ilvl + -65581.320383275)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (328.82724252492 * ilvl + -100068.88150609)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (158.98996247655 * ilvl + -44856.046435272)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (344.02068861371 * ilvl + -105928.53835699)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (161.8368895211 * ilvl + -47124.30535799)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (181.26214574899 * ilvl + -53165.691632928)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (113.55554655214 * ilvl + -34049.4332442)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (156.9666921314 * ilvl + -44892.010236822)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (175.56360225141 * ilvl + -50580.078611632)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (197.16631430585 * ilvl + -58023.031712474)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (161.43038356992 * ilvl + -45852.71730595)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (148.15030820294 * ilvl + -46567.940256046)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (183.84926004228 * ilvl + -54164.075687104)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (282.80247659317 * ilvl + -83925.740561764)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (169.69831932773 * ilvl + -54248.318487395)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (189.55168621701 * ilvl + -55886.673753666)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (146.32441348974 * ilvl + -46756.186217009)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (162.30014094433 * ilvl + -46558.614587738)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (274.5508909695 * ilvl + -81912.150709755)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (208.59537986677 * ilvl + -62732.944557475)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (357.31199033525 * ilvl + -108710.30292963)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (115.16655052265 * ilvl + -34825.457839721)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (170.47682926829 * ilvl + -49418.948780488)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (214.174542523 * ilvl + -65209.135636271)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (173.94548474781 * ilvl + -50383.85487768)
			end,
		},
	},
	[2145] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (272.73748473748 * ilvl + -80619.768009768)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (307.4015037594 * ilvl + -95927.754135338)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (263.0044534413 * ilvl + -78184.851821862)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (244.57368718238 * ilvl + -75505.221908526)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (372.92432432432 * ilvl + -114752.50720721)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (308.44334975369 * ilvl + -93287.743842365)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (302.29638752053 * ilvl + -91550.161740558)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (358.36430481283 * ilvl + -106420.09246881)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (329.6375 * ilvl + -100728.67983871)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (299.95434135884 * ilvl + -90592.90970823)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (340.69153225806 * ilvl + -106885.51612903)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (330.88866995074 * ilvl + -102853.51330049)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (396.02316602317 * ilvl + -117165.61068211)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (271.13801319648 * ilvl + -81666.725073314)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (366.1014965001 * ilvl + -109101.17861452)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (280.10163846052 * ilvl + -83383.211151551)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (322.20688502674 * ilvl + -97478.60394385)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (205.35691367456 * ilvl + -64480.279449962)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (287.01435897436 * ilvl + -86180.892307692)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (321.22459893048 * ilvl + -97431.342245989)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (271.70994371482 * ilvl + -80300.664540338)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (237.59240617135 * ilvl + -66087.287011708)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (248.69769230769 * ilvl + -78890.488461538)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (256.17543859649 * ilvl + -75496.656709341)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (297.64970596161 * ilvl + -84532.952684389)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (268.90248062016 * ilvl + -87251.319224809)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (246.99040090344 * ilvl + -73074.891022021)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (161.5147826087 * ilvl + -49133.364057971)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (233.89471148738 * ilvl + -67961.353306652)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (382.37677616501 * ilvl + -114141.77051184)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (299.37943548387 * ilvl + -90966.913306452)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (328.24656235183 * ilvl + -93741.100047416)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (168.51852942176 * ilvl + -51618.418358451)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (333.01814516129 * ilvl + -101927.15725806)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (322.84228772399 * ilvl + -98546.006883264)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (303.25039849812 * ilvl + -92662.957741496)
			end,
		},
	},
	[2134] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (293.89153225806 * ilvl + -92125.344758065)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (268.41384615385 * ilvl + -85357.067692308)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (192.4384073291 * ilvl + -56709.506976744)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (236.7535042735 * ilvl + -77298.313162393)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (262.42166979362 * ilvl + -80383.601969981)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (249.2182486631 * ilvl + -77242.388034759)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (283.15446906035 * ilvl + -88323.002444614)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (455.01544401547 * ilvl + -138457.44015445)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (233.69197860963 * ilvl + -71891.843850267)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (227.5028692238 * ilvl + -68991.643310178)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (263.80366692131 * ilvl + -82005.190985485)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (263.38997850406 * ilvl + -82326.691298066)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (470.14898785425 * ilvl + -141704.33900135)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (230.43423423423 * ilvl + -70519.677477477)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (428.51963562753 * ilvl + -128827.32004049)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (225.16677807487 * ilvl + -69096.343582888)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (253.44523470839 * ilvl + -76553.268847795)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (141.16868474561 * ilvl + -43377.770624388)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (244.76572580645 * ilvl + -75220.747983871)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (287.24028314028 * ilvl + -89318.815143715)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (248.65588442565 * ilvl + -75957.215856237)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (200.13564869465 * ilvl + -58506.819487672)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (169.93101233296 * ilvl + -53278.978545723)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (213.26576172596 * ilvl + -64535.604884)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (397.35980533522 * ilvl + -118324.13857244)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (199.89112903226 * ilvl + -64131.52016129)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (271.01735107002 * ilvl + -85350.443609035)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (173.31718664477 * ilvl + -56206.284619595)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (204.24041811847 * ilvl + -60897.515679443)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (468.55279571069 * ilvl + -143827.09913557)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (236.08146718147 * ilvl + -71308.004075504)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (426.56707317073 * ilvl + -127188.28902439)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (130.81634491634 * ilvl + -39678.957400257)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (232.16743886744 * ilvl + -70766.558472758)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (290.16739239656 * ilvl + -92524.43728018)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (237.76135084428 * ilvl + -72334.189681051)
			end,
		},
	},
	[2128] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (461.92981283422 * ilvl + -147249.93672014)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (328.65757908319 * ilvl + -100563.87837657)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (255.82804792107 * ilvl + -74431.521141649)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (294.04578754579 * ilvl + -96443.61009361)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (306.39064905599 * ilvl + -92356.348378035)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (352.12226512227 * ilvl + -109324.44337194)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (335.62636320531 * ilvl + -103170.60834519)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (389.81558704453 * ilvl + -120118.2168691)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (344.81484115695 * ilvl + -107473.40896159)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (258.93312191684 * ilvl + -76696.346300211)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (355.99596965386 * ilvl + -110624.63703177)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (381.90675422139 * ilvl + -118797.45515947)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (469.46550522648 * ilvl + -144319.00069686)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (318.00142247511 * ilvl + -97609.651493599)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (434.34397536666 * ilvl + -131799.71487994)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (311.38751608752 * ilvl + -94583.335692836)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (357.91345397328 * ilvl + -110736.46577499)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (179.12793522267 * ilvl + -55049.260728745)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (350.94263196481 * ilvl + -109715.80810117)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (439.74229492651 * ilvl + -140539.93954481)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (373.52311486963 * ilvl + -115092.44693446)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (296.00845665962 * ilvl + -87960.424947146)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (276.86381964809 * ilvl + -90393.507331378)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (314.8210031602 * ilvl + -95690.518407476)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (420.93013937282 * ilvl + -128824.63728223)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (314.93841642229 * ilvl + -103871.42778592)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (447.30623973727 * ilvl + -142949.58866995)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (230.08609566185 * ilvl + -74949.434631072)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (295.94457867714 * ilvl + -89810.332829961)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (449.19324400978 * ilvl + -139344.32929896)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (331.09554291133 * ilvl + -100581.66761498)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (418.15784782433 * ilvl + -125105.8715123)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (177.98851979622 * ilvl + -54307.710504675)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (319.55097202466 * ilvl + -98051.813655761)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (369.3383431085 * ilvl + -114479.63856305)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (328.19238900634 * ilvl + -99568.801268499)
			end,
		},
	},
}