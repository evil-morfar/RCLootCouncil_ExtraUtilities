-- Contains the functions used to calculate RCScore
-- Auto generated with data from WarcraftLogs.com
-- Updated on 05/25/18 00:07:21 by Potdisc

_G.ExtraUtilities_RCScore_Functions = {
	[2064] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (0 * ilvl + 0)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (36873.142857131 * ilvl + -33299220.42856)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (24947.776595745 * ilvl + -21987827.797872)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (21757.158802554 * ilvl + -19802188.970205)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (34201.159973739 * ilvl + -30977768.808513)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (44250.653643725 * ilvl + -40247014.268016)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (34605.80908284 * ilvl + -31215126.612542)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (25237.791463415 * ilvl + -22745263.159756)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (37357.923867596 * ilvl + -33606200.52561)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (39185.401220268 * ilvl + -35456238.686205)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (35597.825865003 * ilvl + -32175228.131756)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (39749.942720667 * ilvl + -36050563.707997)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (22093.230141951 * ilvl + -19613580.243431)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (34476.931742676 * ilvl + -31053790.981577)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (31573.318181818 * ilvl + -28712746.606061)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (37695.520896789 * ilvl + -34220856.86906)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (31089.445661953 * ilvl + -27857989.46773)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (16861.96323449 * ilvl + -15250935.160411)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (38782.990033076 * ilvl + -35231480.165972)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (34672.923897582 * ilvl + -31350149.909673)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (37040.626903802 * ilvl + -33303511.028968)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (32034.077853922 * ilvl + -28757926.016213)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (24976.066666667 * ilvl + -22804320.638095)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (33811.733959102 * ilvl + -30454110.824135)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (23101.174617579 * ilvl + -20655238.601454)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (18595.062834225 * ilvl + -16799031.656417)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (37179.826567458 * ilvl + -33521819.986213)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (21744.542038796 * ilvl + -19904209.961105)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (36155.671523753 * ilvl + -32666034.532812)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (27282.475687104 * ilvl + -24679652.581395)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (37574.024587425 * ilvl + -33915120.717821)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (29273.681365576 * ilvl + -26516979.009957)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (24343.35862069 * ilvl + -22359317.641379)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (41739.633743764 * ilvl + -38193331.182148)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (39883.706074122 * ilvl + -36297962.085474)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (32082.151827012 * ilvl + -28798011.29556)
			end,
		},
	},
	[2073] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (0 * ilvl + 0)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (50600.708377826 * ilvl + -46497851.663014)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (27857.832591093 * ilvl + -24958877.415655)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (21816.363418803 * ilvl + -19930217.478974)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (37734.936134454 * ilvl + -34400007.539496)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (43016.493969608 * ilvl + -39365293.317594)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (39514.613636364 * ilvl + -36051035.833333)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (25358.463289369 * ilvl + -23175001.121434)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (39123.79116599 * ilvl + -35660621.970759)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (43571.477942053 * ilvl + -39792853.489618)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (35853.993351792 * ilvl + -32640210.232854)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (42081.950875212 * ilvl + -38800149.070017)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (20651.29374111 * ilvl + -18617504.231152)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (58922.502559065 * ilvl + -53896389.533494)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (27847.419530723 * ilvl + -25565952.269596)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (41721.807803542 * ilvl + -38178008.729733)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (31074.527753018 * ilvl + -27975493.974259)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (18526.429946524 * ilvl + -16871412.352941)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (-47430 * ilvl + 47746486.666667)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (56464.947177419 * ilvl + -51994197.970565)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (54047.51129841 * ilvl + -49200432.822371)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (37980.75551193 * ilvl + -34555527.710661)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (23997.627131133 * ilvl + -21985706.291407)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (29939.067185651 * ilvl + -27001431.705965)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (20739.80183228 * ilvl + -18713240.915919)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (22191.270769231 * ilvl + -20353023.849231)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (44977.090240642 * ilvl + -41237273.781194)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (32982.35958486 * ilvl + -30707693.692308)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (61675.816413228 * ilvl + -56745666.36682)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (22407.045864467 * ilvl + -20381941.218213)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (35574.12177739 * ilvl + -32188057.168821)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (22025.398472116 * ilvl + -19941558.085409)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (26941.416996047 * ilvl + -24936497.992095)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (43620.306968178 * ilvl + -40100577.699103)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (37368.197242914 * ilvl + -34159751.93008)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (39071.422737217 * ilvl + -35483862.598385)
			end,
		},
	},
	[2074] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (46376.666666667 * ilvl + -42705243.333333)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (53936.929788601 * ilvl + -49255247.57732)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (29108.396530612 * ilvl + -25867884.205714)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (32781.921099468 * ilvl + -30120526.100713)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (53147.440392644 * ilvl + -48623568.720907)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (41084.337630662 * ilvl + -37175110.583624)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (44630.068795073 * ilvl + -40482865.99033)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (33977.83801526 * ilvl + -31110848.804248)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (35655.600413845 * ilvl + -32084893.8379)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (52244.992599445 * ilvl + -47588993.327475)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (56080.093564464 * ilvl + -51461388.724867)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (44559.474439249 * ilvl + -40779301.772133)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (24544.941238472 * ilvl + -22108577.231884)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (58840.609795631 * ilvl + -53679761.76568)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (38939.69859944 * ilvl + -35840028.214006)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (45348.772465774 * ilvl + -41204301.499895)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (44244.113061224 * ilvl + -40171479.943673)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (22574.446515679 * ilvl + -20581262.086585)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (54112.763345466 * ilvl + -49806633.033412)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (55235.260168792 * ilvl + -50384897.265283)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (42132.224883518 * ilvl + -37899383.396993)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (38901.149586671 * ilvl + -35045315.75382)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (34187.868382931 * ilvl + -31408297.678198)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (42533.16244898 * ilvl + -38559438.24)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (32950.838339921 * ilvl + -29955882.386298)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (25620.186248013 * ilvl + -23503204.562209)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (40415.719876063 * ilvl + -36606203.36225)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (29223.727530364 * ilvl + -27004985.018893)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (63879.639603335 * ilvl + -58665494.792021)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (28504.11076164 * ilvl + -25955484.726118)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (46236.690516206 * ilvl + -41870780.337719)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (26318.710344267 * ilvl + -23813814.277008)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (33120.413300493 * ilvl + -30686937.008374)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (45774.21036234 * ilvl + -41811285.826085)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (36080.727391776 * ilvl + -32620957.244101)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (42670.123939651 * ilvl + -38606907.312424)
			end,
		},
	},
	[2082] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (43875.769230947 * ilvl + -40668613.46171)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (31572.845257779 * ilvl + -28489649.631187)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (24296.189639223 * ilvl + -21630036.020352)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (22016.062337058 * ilvl + -20161283.888356)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (31526.266477003 * ilvl + -28546870.686581)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (30251.754878049 * ilvl + -27224797.415854)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (30131.191300271 * ilvl + -27169202.293303)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (24926.321626215 * ilvl + -22450360.675831)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (31342.312902644 * ilvl + -28347677.998284)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (29206.983170488 * ilvl + -26242806.74937)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (28454.766102889 * ilvl + -25705974.59845)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (41899.170046565 * ilvl + -38505255.000225)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (20366.432460903 * ilvl + -18119214.537585)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (26005.060216916 * ilvl + -23379515.665994)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (23652.391377005 * ilvl + -21440036.146168)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (31673.582276547 * ilvl + -28657442.188388)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (26266.316201047 * ilvl + -23531779.850576)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (13946.671736514 * ilvl + -12594934.860816)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (32563.51253118 * ilvl + -29613145.064542)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (32088.267188241 * ilvl + -29087023.87909)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (27717.511781195 * ilvl + -24915623.424718)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (27340.183891403 * ilvl + -24479170.459427)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (18085.017366947 * ilvl + -16410154.17535)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (26297.84071594 * ilvl + -23583749.057968)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (25807.843244688 * ilvl + -23283186.800278)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (14974.827540107 * ilvl + -13522451.508467)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (31025.373481781 * ilvl + -28073068.886977)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (16980.084026813 * ilvl + -15587857.917107)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (27600.904151563 * ilvl + -24822379.371322)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (24403.187405618 * ilvl + -21974180.999698)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (29315.77471477 * ilvl + -26293691.405982)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (23517.793194004 * ilvl + -21086188.565926)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (19045.255665025 * ilvl + -17435381.564532)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (30576.91406071 * ilvl + -27758353.096877)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (31937.495413485 * ilvl + -28994531.075774)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (27657.962430215 * ilvl + -24767788.890995)
			end,
		},
	},
	[2075] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (38448.139534467 * ilvl + -35495580.464715)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (44665.957474196 * ilvl + -40589063.015557)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (21727.706488264 * ilvl + -19357542.071347)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (18069.875366569 * ilvl + -16475625.164956)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (37274.842579422 * ilvl + -33870103.137032)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (32415.138866397 * ilvl + -29145810.140891)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (23090.189517618 * ilvl + -20743964.55819)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (19610.78677141 * ilvl + -17743762.716646)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (45515.069545145 * ilvl + -41515393.609747)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (31789.143287167 * ilvl + -28906586.015294)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (39091.816210518 * ilvl + -35561772.564212)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (40607.048697325 * ilvl + -36849546.253891)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (18862.414376321 * ilvl + -17017261.739958)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (34620.037148898 * ilvl + -31430094.528239)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (17666.860703812 * ilvl + -16103944.047104)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (26315.824197861 * ilvl + -23703583.805704)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (38664.776974842 * ilvl + -35145295.174905)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (12985.21097561 * ilvl + -11607282.806098)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (21463.024833447 * ilvl + -19424316.064821)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (24705.843308896 * ilvl + -22285825.074735)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (46791.044177671 * ilvl + -42625709.651765)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (27492.373733107 * ilvl + -24630100.730134)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (16877.344817927 * ilvl + -15246648.855742)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (30133.630022654 * ilvl + -27165213.611251)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (16285.149022019 * ilvl + -14692916.51856)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (21281.424140565 * ilvl + -19438679.151719)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (34220.299933076 * ilvl + -31094776.048646)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (17398.714671815 * ilvl + -15826228.295839)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (43794.905159588 * ilvl + -40028015.223403)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (18853.68964233 * ilvl + -17035329.786306)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (33968.586327634 * ilvl + -30562385.41036)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (21238.374492732 * ilvl + -19216559.164692)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (22074.629173508 * ilvl + -20214256.24439)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (30168.408123345 * ilvl + -27511619.115065)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (41418.207991242 * ilvl + -37993083.20416)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (23673.537526981 * ilvl + -21217287.144558)
			end,
		},
	},
	[2076] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (42685 * ilvl + -39153060)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (33588.955752756 * ilvl + -30182919.651888)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (26654.35577431 * ilvl + -23607297.402353)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (25486.893631041 * ilvl + -23377308.041626)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (31810.328947368 * ilvl + -28507255.003374)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (32937.095137421 * ilvl + -29515431.80444)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (34563.640709829 * ilvl + -30952122.312995)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (21800.999936338 * ilvl + -19517933.19998)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (29391.609332528 * ilvl + -26244195.363787)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (33978.695590503 * ilvl + -30570679.962874)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (32741.460800185 * ilvl + -29571144.914662)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (39410.50659824 * ilvl + -35934014.40011)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (20763.356653491 * ilvl + -18503099.60628)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (30346.660248043 * ilvl + -27196949.085503)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (25145.58627451 * ilvl + -22826526.722969)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (36309.440419329 * ilvl + -32716929.238672)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (29921.995510204 * ilvl + -26680880.136327)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (16219.982693441 * ilvl + -14669051.469519)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (36819.078378413 * ilvl + -33375340.681115)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (31542.624912892 * ilvl + -28336910.373868)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (31108.663147983 * ilvl + -27871056.03892)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (31947.252066344 * ilvl + -28499882.363625)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (21676.548582996 * ilvl + -19775620.50135)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (29385.328868778 * ilvl + -26256389.775566)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (23251.631884058 * ilvl + -20933891.281159)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (20138.381727014 * ilvl + -18407736.271789)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (31085.051354312 * ilvl + -27835756.318129)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (20875.943319838 * ilvl + -19178778.40081)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (29319.628748925 * ilvl + -26277935.367943)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (22680.512488437 * ilvl + -20424626.543016)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (32310.98812693 * ilvl + -28791132.889243)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (22694.764628776 * ilvl + -20357330.611123)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (20655.824776082 * ilvl + -18864157.419486)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (38029.512635322 * ilvl + -34426998.789161)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (31557.121245829 * ilvl + -28360077.835373)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (31753.208423795 * ilvl + -28276821.10727)
			end,
		},
	},
	[2069] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (42294.520547675 * ilvl + -38774204.657274)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (34494.671862348 * ilvl + -30886605.305601)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (28097.069511487 * ilvl + -24939397.919534)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (22765.981074481 * ilvl + -20674314.607652)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (35064.394420414 * ilvl + -31558677.480031)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (35062.522262054 * ilvl + -31499666.459482)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (35176.703687493 * ilvl + -31593639.424992)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (34626.555465587 * ilvl + -31400499.580297)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (34737.441186125 * ilvl + -31280978.475982)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (36716.322813409 * ilvl + -33074683.585769)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (33903.178571429 * ilvl + -30618084.143728)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (42205.381538462 * ilvl + -38589917.843077)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (32792.371384402 * ilvl + -29680970.509049)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (34867.78441903 * ilvl + -31459388.531401)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (39808.005013369 * ilvl + -36389705.146168)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (33568.296364326 * ilvl + -30126086.976968)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (28509.258065432 * ilvl + -25344661.478748)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (15788.797375047 * ilvl + -14209106.537727)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (45692.239422085 * ilvl + -41827472.700378)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (34565.888006112 * ilvl + -31133977.523759)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (31154.789431082 * ilvl + -27961055.400439)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (33159.027271009 * ilvl + -29691795.606673)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (23153.606617647 * ilvl + -21091771.687389)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (30930.020351526 * ilvl + -27729953.560592)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (28502.244191073 * ilvl + -25671531.751039)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (19628.9243604 * ilvl + -17851314.130219)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (30883.377007633 * ilvl + -27591833.676271)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (19092.237903226 * ilvl + -17497751.469758)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (32310.382591093 * ilvl + -29012815.849528)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (38494.104315197 * ilvl + -35095468.790432)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (32680.108560885 * ilvl + -29171684.192113)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (36320.51969112 * ilvl + -33083190.476963)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (25471.755213675 * ilvl + -23464155.288205)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (32238.531282051 * ilvl + -28988857.044103)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (35947.381852552 * ilvl + -32551012.21172)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (31011.452082838 * ilvl + -27643667.449952)
			end,
		},
	},
	[2092] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (24825.909091059 * ilvl + -22185079.091054)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (36814.046558704 * ilvl + -33370050.864372)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (28540.515909885 * ilvl + -25592350.160238)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (22352.090434783 * ilvl + -20475316.398116)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (34251.848032243 * ilvl + -31005447.678521)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (37356.66518219 * ilvl + -33908368.637174)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (39536.747237116 * ilvl + -36031641.010723)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (23226.312707444 * ilvl + -21109922.554291)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (35097.539213486 * ilvl + -31893136.992851)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (39745.252834008 * ilvl + -36168041.47139)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (37438.95174216 * ilvl + -34124979.672997)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (41591.768461538 * ilvl + -38209025.125385)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (19375.008403361 * ilvl + -17423029.455462)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (42644.921775899 * ilvl + -38758038.600423)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (25305.305418719 * ilvl + -23197216.807882)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (31743.358700382 * ilvl + -28623853.864375)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (31449.944946908 * ilvl + -28304214.934726)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (14750.002382698 * ilvl + -13344733.014479)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (49751.630546956 * ilvl + -46008240.440316)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (42661.535014006 * ilvl + -38939829.932773)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (37420.058222121 * ilvl + -33905567.230588)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (37863.707330317 * ilvl + -34205001.402413)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (24767.116747613 * ilvl + -22786155.27811)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (33294.736275933 * ilvl + -30068015.896269)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (24604.100144189 * ilvl + -22407734.520469)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (14926.529230769 * ilvl + -13420967.156923)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (34891.893385523 * ilvl + -31711110.772875)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (22561.704086416 * ilvl + -20882731.433543)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (45434.956938412 * ilvl + -41673863.757904)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (23640.512955466 * ilvl + -21554435.539811)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (37105.113507394 * ilvl + -33577981.48521)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (23670.418123742 * ilvl + -21511452.236677)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (22801.576955088 * ilvl + -20977547.127057)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (37651.065141267 * ilvl + -34407720.39097)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (30324.910810837 * ilvl + -27382039.081107)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (34797.693926194 * ilvl + -31416971.960836)
			end,
		},
	},
	[2070] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (0 * ilvl + 0)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (52194.824093912 * ilvl + -47041023.660999)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (31527.891396855 * ilvl + -27890004.968918)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (30855.613836109 * ilvl + -28178450.438476)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (50848.621679894 * ilvl + -45802423.152842)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (54460.677098109 * ilvl + -49138434.950316)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (43826.000851948 * ilvl + -39379818.741571)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (29653.372163495 * ilvl + -26946657.551092)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (49096.775687104 * ilvl + -44117835.246089)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (44730.778654261 * ilvl + -40198889.229765)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (45427.677809566 * ilvl + -40909074.89966)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (57971.23220391 * ilvl + -52690466.028903)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (20441.176230746 * ilvl + -18207494.96859)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (52069.453334644 * ilvl + -46919302.63118)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (28041.175095493 * ilvl + -25617016.357066)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (37072.426290091 * ilvl + -33010668.644643)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (43674.188652482 * ilvl + -39147967.613013)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (19561.085553471 * ilvl + -17506854.438555)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (48602.224163741 * ilvl + -44198400.346966)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (46649.98774483 * ilvl + -42263327.674472)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (45142.184457156 * ilvl + -40533366.426193)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (42615.566635362 * ilvl + -38212174.056049)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (28560.68767507 * ilvl + -25858156.570028)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (39031.565124761 * ilvl + -34758048.52192)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (27102.919219934 * ilvl + -24574507.808179)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (26917.678099999 * ilvl + -24298546.677457)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (42682.152345216 * ilvl + -38307864.222889)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (25748.606692407 * ilvl + -23398792.612527)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (61202.807234882 * ilvl + -55466125.993397)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (26141.707641634 * ilvl + -23745840.213043)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (46330.862346939 * ilvl + -41540075.194388)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (23512.281454778 * ilvl + -21159047.539804)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (29612.910837438 * ilvl + -26902214.239901)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (45557.246043608 * ilvl + -41201902.76288)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (45712.264957265 * ilvl + -41274328.803419)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (42332.698576239 * ilvl + -37958016.3469)
			end,
		},
	},
	[2063] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (50688.333333333 * ilvl + -47211655)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (35054.774400187 * ilvl + -31822042.886224)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (28619.076454034 * ilvl + -25704914.959099)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (22555.491538462 * ilvl + -20683495.894615)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (33323.666921314 * ilvl + -30207830.077922)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (33044.311759128 * ilvl + -29858779.232812)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (31741.97189992 * ilvl + -28629603.810261)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (35402.919839878 * ilvl + -32333737.733825)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (31855.858365164 * ilvl + -28845516.494576)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (33997.578628368 * ilvl + -30801228.089544)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (31885.046737032 * ilvl + -28944208.520712)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (36539.909090909 * ilvl + -33571145.796537)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (29819.601680672 * ilvl + -26926934.816807)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (34736.948790896 * ilvl + -31468063.328592)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (36890.944396272 * ilvl + -33739065.681858)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (25957.948823207 * ilvl + -23231417.512589)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (25099.485566784 * ilvl + -22385381.144817)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (15128.71297654 * ilvl + -13703212.140396)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (57656.133056083 * ilvl + -53723146.923029)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (33865.894077581 * ilvl + -30811113.073792)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (34162.451375827 * ilvl + -31060886.163567)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (29255.463090511 * ilvl + -26285327.229398)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (20400.462407143 * ilvl + -18635084.172946)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (27987.992389006 * ilvl + -25152790.697252)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (30944.585264093 * ilvl + -28006279.400344)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (15072.423589744 * ilvl + -13582471.975385)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (30823.721407625 * ilvl + -27872544.542339)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (18007.050116462 * ilvl + -16566268.921369)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (36121.668479734 * ilvl + -33034736.161593)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (30396.515410147 * ilvl + -27581614.469417)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (30566.596341463 * ilvl + -27472107.068293)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (28473.968534629 * ilvl + -25673633.94455)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (25872.35037594 * ilvl + -23990433.338346)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (34174.313715409 * ilvl + -31118435.686356)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (37420.118603293 * ilvl + -34247930.637007)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (27510.441651032 * ilvl + -24572119.764165)
			end,
		},
	},
	[2088] = {
		["HUNTER"] = {
			[255] = function(dps, ilvl)
				return 100 * dps / (137990 * ilvl + -131402550)
			end,
			[254] = function(dps, ilvl)
				return 100 * dps / (32975.604333078 * ilvl + -29575355.569975)
			end,
			[253] = function(dps, ilvl)
				return 100 * dps / (29357.540944327 * ilvl + -26185708.408739)
			end,
		},
		["WARRIOR"] = {
			[73] = function(dps, ilvl)
				return 100 * dps / (24142.199014778 * ilvl + -22092754.789163)
			end,
			[71] = function(dps, ilvl)
				return 100 * dps / (35734.945945946 * ilvl + -32273043.72973)
			end,
			[72] = function(dps, ilvl)
				return 100 * dps / (33917.89727955 * ilvl + -30409495.122889)
			end,
		},
		["SHAMAN"] = {
			[263] = function(dps, ilvl)
				return 100 * dps / (33955.729948572 * ilvl + -30518909.306708)
			end,
			[264] = function(dps, ilvl)
				return 100 * dps / (19421.889343055 * ilvl + -17492899.552427)
			end,
			[262] = function(dps, ilvl)
				return 100 * dps / (36328.859156443 * ilvl + -32908835.19105)
			end,
		},
		["MAGE"] = {
			[64] = function(dps, ilvl)
				return 100 * dps / (36168.598030019 * ilvl + -32643244.238743)
			end,
			[63] = function(dps, ilvl)
				return 100 * dps / (30962.270804635 * ilvl + -27897151.67928)
			end,
			[62] = function(dps, ilvl)
				return 100 * dps / (41891.99998349 * ilvl + -38352780.501343)
			end,
		},
		["PRIEST"] = {
			[257] = function(dps, ilvl)
				return 100 * dps / (20742.607491289 * ilvl + -18637690.754878)
			end,
			[258] = function(dps, ilvl)
				return 100 * dps / (32383.737541131 * ilvl + -29093434.576639)
			end,
			[256] = function(dps, ilvl)
				return 100 * dps / (26141.507514663 * ilvl + -23883401.874084)
			end,
		},
		["DEATHKNIGHT"] = {
			[252] = function(dps, ilvl)
				return 100 * dps / (29951.523200843 * ilvl + -26850847.955331)
			end,
			[251] = function(dps, ilvl)
				return 100 * dps / (30005.757839262 * ilvl + -26831615.610013)
			end,
			[250] = function(dps, ilvl)
				return 100 * dps / (16316.790896159 * ilvl + -14735427.13229)
			end,
		},
		["WARLOCK"] = {
			[266] = function(dps, ilvl)
				return 100 * dps / (41920.170688141 * ilvl + -38410054.008068)
			end,
			[267] = function(dps, ilvl)
				return 100 * dps / (40349.363706564 * ilvl + -36747776.840154)
			end,
			[265] = function(dps, ilvl)
				return 100 * dps / (32823.85276918 * ilvl + -29535249.030954)
			end,
		},
		["DEMONHUNTER"] = {
			[577] = function(dps, ilvl)
				return 100 * dps / (34563.213139499 * ilvl + -31132948.379883)
			end,
			[581] = function(dps, ilvl)
				return 100 * dps / (19780.831627196 * ilvl + -17950882.28602)
			end,
		},
		["PALADIN"] = {
			[70] = function(dps, ilvl)
				return 100 * dps / (31751.632936213 * ilvl + -28519742.718385)
			end,
			[65] = function(dps, ilvl)
				return 100 * dps / (19621.850800362 * ilvl + -17616822.15977)
			end,
			[66] = function(dps, ilvl)
				return 100 * dps / (17711.148790323 * ilvl + -16049969.458871)
			end,
		},
		["DRUID"] = {
			[103] = function(dps, ilvl)
				return 100 * dps / (33894.051289696 * ilvl + -30608631.895324)
			end,
			[104] = function(dps, ilvl)
				return 100 * dps / (18419.097262502 * ilvl + -16853914.935177)
			end,
			[102] = function(dps, ilvl)
				return 100 * dps / (31989.306134335 * ilvl + -28849952.619069)
			end,
			[105] = function(dps, ilvl)
				return 100 * dps / (22593.629527591 * ilvl + -20413581.521244)
			end,
		},
		["MONK"] = {
			[269] = function(dps, ilvl)
				return 100 * dps / (36335.511008326 * ilvl + -32566256.301203)
			end,
			[270] = function(dps, ilvl)
				return 100 * dps / (19835.76149834 * ilvl + -17759163.790422)
			end,
			[268] = function(dps, ilvl)
				return 100 * dps / (21855.255126181 * ilvl + -19966694.31009)
			end,
		},
		["ROGUE"] = {
			[260] = function(dps, ilvl)
				return 100 * dps / (36720.040378784 * ilvl + -33356439.446005)
			end,
			[261] = function(dps, ilvl)
				return 100 * dps / (39589.111531191 * ilvl + -36099622.68431)
			end,
			[259] = function(dps, ilvl)
				return 100 * dps / (33306.774237391 * ilvl + -29888763.951978)
			end,
		},
	},
}