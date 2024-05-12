local mounts = MountsJournal


mounts.mountsDB = setmetatable({
	[6] = {1, 1806, 3}, -- 458 Brown Horse (Alliance)
	[7] = {1, 3105, 3}, -- 459 Gray Wolf
	[8] = {1, 1806, 3}, -- 468 White Stallion
	[9] = {1, 1806, 3}, -- 470 Black Stallion (Alliance)
	[11] = {1, 1806, 3}, -- 472 Pinto (Alliance)
	[12] = {1, 3105, 3}, -- 578 Black Wolf
	[13] = {1, 3105, 3}, -- 579 Red Wolf
	[14] = {1, 3105, 3}, -- 580 Timber Wolf (Horde)
	[15] = {1, 3105, 3}, -- 581 Winter Wolf
	[17] = {1, {901,1801}, 2}, -- 5784 Felsteed
	[18] = {1, 1806, 3}, -- 6648 Chestnut Mare (Alliance)
	[19] = {1, 3105, 3}, -- 6653 Dire Wolf (Horde)
	[20] = {1, 3105, 3}, -- 6654 Brown Wolf (Horde)
	[21] = {1, 502, 3}, -- 6777 Gray Ram (Alliance)
	[22] = {1, 502, 3}, -- 6896 Black Ram
	[24] = {1, 502, 3}, -- 6898 White Ram (Alliance)
	[25] = {1, 502, 3}, -- 6899 Brown Ram (Alliance)
	[26] = {1, 706, 3}, -- 8394 Striped Frostsaber (Alliance)
	[27] = {1, 1104, 3}, -- 8395 Emerald Raptor (Horde)
	[28] = {1, 1807, 3}, -- 8980 Skeletal Horse
	[31] = {1, 706, 3}, -- 10789 Spotted Frostsaber (Alliance)
	[34] = {1, 706, 3}, -- 10793 Striped Nightsaber (Alliance)
	[35] = {1, 1104, 3}, -- 10795 Ivory Raptor
	[36] = {1, 1104, 3}, -- 10796 Turquoise Raptor (Horde)
	[38] = {1, 1104, 3}, -- 10799 Violet Raptor (Horde)
	[39] = {1, 2914, 3}, -- 10873 Red Mechanostrider (Alliance)
	[40] = {1, 2914, 3}, -- 10969 Blue Mechanostrider (Alliance)
	[41] = {1, 1800, 2}, -- 13819 Summon Warhorse (Alliance)
	[42] = {1, 2914, 3}, -- 15779 White Mechanostrider Mod B (Alliance)
	[43] = {1, 2914, 3}, -- 15780 Green Mechanostrider
	[45] = {1, 706, 3}, -- 16055 Black Nightsaber (Alliance)
	[46] = {1, 706, 3}, -- 16056 Ancient Frostsaber (Alliance)
	[50] = {1, 3105, 3}, -- 16080 Red Wolf (Horde)
	[51] = {1, 3105, 1}, -- 16081 Winter Wolf (Horde)
	[52] = {1, 1806, 3}, -- 16082 Palomino (Alliance)
	[53] = {1, 1806, 3}, -- 16083 White Stallion (Alliance)
	[54] = {1, 1104, 3}, -- 16084 Mottled Red Raptor (Horde)
	[55] = {1, 706, 2}, -- 17229 Winterspring Frostsaber (Alliance)
	[56] = {1, 1104, 3}, -- 17450 Ivory Raptor (Horde)
	[57] = {1, 2914, 3}, -- 17453 Green Mechanostrider (Alliance)
	[58] = {1, 2914, 3}, -- 17454 Unpainted Mechanostrider (Alliance)
	[62] = {1, 2914, 3}, -- 17459 Icy Blue Mechanostrider Mod A (Alliance)
	[63] = {1, 502, 3}, -- 17460 Frost Ram (Alliance)
	[64] = {1, 502, 3}, -- 17461 Black Ram (Alliance)
	[65] = {1, 1807, 3}, -- 17462 Red Skeletal Horse (Horde)
	[66] = {1, 1807, 3}, -- 17463 Blue Skeletal Horse (Horde)
	[67] = {1, 1807, 3}, -- 17464 Brown Skeletal Horse (Horde)
	[68] = {1, 1807, 3}, -- 17465 Green Skeletal Warhorse (Horde)
	[69] = {1, 1807, 1}, -- 17481 Rivendare's Deathcharger
	[70] = {1, 2503, 3}, -- 18363 Riding Kodo
	[71] = {1, 2503, 3}, -- 18989 Gray Kodo (Horde)
	[72] = {1, 2503, 3}, -- 18990 Brown Kodo (Horde)
	[73] = {1, 2503, 3}, -- 18991 Green Kodo (Horde)
	[74] = {1, 2503, 3}, -- 18992 Teal Kodo (Horde)
	[83] = {1, {901,1801}, 2}, -- 23161 Dreadsteed
	[84] = {1, 1800, 2}, -- 23214 Summon Charger (Alliance)
	[85] = {1, 706, 3}, -- 23219 Swift Mistsaber (Alliance)
	[87] = {1, 706, 3}, -- 23221 Swift Frostsaber (Alliance)
	[88] = {1, 2914, 3}, -- 23222 Swift Yellow Mechanostrider (Alliance)
	[89] = {1, 2914, 3}, -- 23223 Swift White Mechanostrider (Alliance)
	[90] = {1, 2914, 3}, -- 23225 Swift Green Mechanostrider (Alliance)
	[91] = {1, 1806, 3}, -- 23227 Swift Palomino (Alliance)
	[92] = {1, 1806, 3}, -- 23228 Swift White Steed (Alliance)
	[93] = {1, 1806, 3}, -- 23229 Swift Brown Steed (Alliance)
	[94] = {1, 502, 3}, -- 23238 Swift Brown Ram (Alliance)
	[95] = {1, 502, 3}, -- 23239 Swift Gray Ram (Alliance)
	[96] = {1, 502, 3}, -- 23240 Swift White Ram (Alliance)
	[97] = {1, 1104, 3}, -- 23241 Swift Blue Raptor (Horde)
	[98] = {1, 1104, 3}, -- 23242 Swift Olive Raptor (Horde)
	[99] = {1, 1104, 3}, -- 23243 Swift Orange Raptor (Horde)
	[100] = {1, 1807, 3}, -- 23246 Purple Skeletal Warhorse (Horde)
	[101] = {1, 2503, 3}, -- 23247 Great White Kodo (Horde)
	[102] = {1, 2503, 3}, -- 23248 Great Gray Kodo (Horde)
	[103] = {1, 2503, 3}, -- 23249 Great Brown Kodo (Horde)
	[104] = {1, 3105, 3}, -- 23250 Swift Brown Wolf (Horde)
	[105] = {1, 3105, 3}, -- 23251 Swift Timber Wolf (Horde)
	[106] = {1, 3105, 3}, -- 23252 Swift Gray Wolf (Horde)
	[107] = {1, 706, 3}, -- 23338 Swift Stormsaber (Alliance)
	[108] = {1, 3105, 3}, -- 23509 Frostwolf Howler (Horde)
	[109] = {1, 502, 3}, -- 23510 Stormpike Battle Charger (Alliance)
	[110] = {1, 1104, 1}, -- 24242 Swift Razzashi Raptor
	[111] = {1, 708, 1}, -- 24252 Swift Zulian Tiger
	[116] = {1, 2008, 1}, -- 25863 Black Qiraji Battle Tank
	[117] = {1, 2008, 1}, -- 25953 Blue Qiraji Battle Tank
	[118] = {1, 2008, 1}, -- 26054 Red Qiraji Battle Tank
	[119] = {1, 2008, 1}, -- 26055 Yellow Qiraji Battle Tank
	[120] = {1, 2008, 1}, -- 26056 Green Qiraji Battle Tank
	[121] = {1, 2008, 1}, -- 26655 Black Qiraji Battle Tank
	[122] = {1, 2008, 1}, -- 26656 Black Qiraji Battle Tank
	[145] = {1, 2914, 3}, -- 33630 Blue Mechanostrider
	[75] = {2, 1806, 3}, -- 22717 Black War Steed (Alliance)
	[76] = {2, 2503, 3}, -- 22718 Black War Kodo (Horde)
	[77] = {2, 2914, 3}, -- 22719 Black Battlestrider (Alliance)
	[78] = {2, 502, 3}, -- 22720 Black War Ram (Alliance)
	[79] = {2, 1104, 3}, -- 22721 Black War Raptor (Horde)
	[80] = {2, 1807, 3}, -- 22722 Red Skeletal Warhorse (Horde)
	[81] = {2, 706, 3}, -- 22723 Black War Tiger (Alliance)
	[82] = {2, 3105, 3}, -- 22724 Black War Wolf (Horde)
	[123] = {2, 1303, 3}, -- 28828 Nether Drake
	[129] = {2, 1500, 3}, -- 32235 Golden Gryphon (Alliance)
	[130] = {2, 1500, 3}, -- 32239 Ebon Gryphon (Alliance)
	[131] = {2, 1500, 3}, -- 32240 Snowy Gryphon (Alliance)
	[132] = {2, 1500, 3}, -- 32242 Swift Blue Gryphon (Alliance)
	[133] = {2, 1504, 3}, -- 32243 Tawny Wind Rider (Horde)
	[134] = {2, 1504, 3}, -- 32244 Blue Wind Rider (Horde)
	[135] = {2, 1504, 1}, -- 32245 Green Wind Rider (Horde)
	[136] = {2, 1504, 3}, -- 32246 Swift Red Wind Rider (Horde)
	[137] = {2, 1500, 3}, -- 32289 Swift Red Gryphon (Alliance)
	[138] = {2, 1500, 3}, -- 32290 Swift Green Gryphon (Alliance)
	[139] = {2, 1500, 3}, -- 32292 Swift Purple Gryphon (Alliance)
	[140] = {2, 1504, 3}, -- 32295 Swift Green Wind Rider (Horde)
	[141] = {2, 1504, 3}, -- 32296 Swift Yellow Wind Rider (Horde)
	[142] = {2, 1504, 3}, -- 32297 Swift Purple Wind Rider (Horde)
	[146] = {2, 406, 3}, -- 33660 Swift Pink Hawkstrider (Horde)
	[147] = {2, 2804, 3}, -- 34406 Brown Elekk (Alliance)
	[149] = {2, 1800, 2}, -- 34767 Thalassian Charger (Horde)
	[150] = {2, 1800, 2}, -- 34769 Thalassian Warhorse (Horde)
	[151] = {2, 504, 3}, -- 34790 Dark War Talbuk
	[152] = {2, 406, 3}, -- 34795 Red Hawkstrider (Horde)
	[153] = {2, 504, 3}, -- 34896 Cobalt War Talbuk
	[154] = {2, 504, 3}, -- 34897 White War Talbuk
	[155] = {2, 504, 3}, -- 34898 Silver War Talbuk
	[156] = {2, 504, 3}, -- 34899 Tan War Talbuk
	[157] = {2, 406, 3}, -- 35018 Purple Hawkstrider (Horde)
	[158] = {2, 406, 3}, -- 35020 Blue Hawkstrider (Horde)
	[159] = {2, 406, 3}, -- 35022 Black Hawkstrider (Horde)
	[160] = {2, 406, 3}, -- 35025 Swift Green Hawkstrider (Horde)
	[161] = {2, 406, 3}, -- 35027 Swift Purple Hawkstrider (Horde)
	[162] = {2, 406, 3}, -- 35028 Swift Warstrider (Horde)
	[163] = {2, 2804, 3}, -- 35710 Gray Elekk (Alliance)
	[164] = {2, 2804, 3}, -- 35711 Purple Elekk (Alliance)
	[165] = {2, 2804, 3}, -- 35712 Great Green Elekk (Alliance)
	[166] = {2, 2804, 3}, -- 35713 Great Blue Elekk (Alliance)
	[167] = {2, 2804, 3}, -- 35714 Great Purple Elekk (Alliance)
	[168] = {2, {901,1801}, 1}, -- 36702 Fiery Warhorse
	[169] = {2, 1303, 6}, -- 37015 Swift Nether Drake
	[170] = {2, 504, 3}, -- 39315 Cobalt Riding Talbuk
	[171] = {2, 504, 3}, -- 39316 Dark Riding Talbuk
	[172] = {2, 504, 3}, -- 39317 Silver Riding Talbuk
	[173] = {2, 504, 3}, -- 39318 Tan Riding Talbuk
	[174] = {2, 504, 3}, -- 39319 White Riding Talbuk
	[176] = {2, 2302, 3}, -- 39798 Green Riding Nether Ray
	[177] = {2, 2302, 3}, -- 39800 Red Riding Nether Ray
	[178] = {2, 2302, 3}, -- 39801 Purple Riding Nether Ray
	[179] = {2, 2302, 3}, -- 39802 Silver Riding Nether Ray
	[180] = {2, 2302, 3}, -- 39803 Blue Riding Nether Ray
	[183] = {2, {413,1402}, 1}, -- 40192 Ashes of Al'ar
	[185] = {2, 417, 1}, -- 41252 Raven Lord
	[186] = {2, 1303, 2}, -- 41513 Onyx Netherwing Drake
	[187] = {2, 1303, 2}, -- 41514 Azure Netherwing Drake
	[188] = {2, 1303, 2}, -- 41515 Cobalt Netherwing Drake
	[189] = {2, 1303, 2}, -- 41516 Purple Netherwing Drake
	[190] = {2, 1303, 2}, -- 41517 Veridian Netherwing Drake
	[191] = {2, 1303, 2}, -- 41518 Violet Netherwing Drake
	[199] = {2, 600, 1}, -- 43688 Amani War Bear
	[201] = {2, 502, 7}, -- 43899 Brewfest Ram
	[202] = {2, 502, 1}, -- 43900 Swift Brewfest Ram
	[203] = {2, 1501, 3}, -- 43927 Cenarion War Hippogryph
	[204] = {2, 2907, 4}, -- 44151 Turbo-Charged Flying Machine
	[205] = {2, 2907, 4}, -- 44153 Flying Machine
	[206] = {2, 1303, 6}, -- 44317 Merciless Nether Drake
	[207] = {2, 1303, 6}, -- 44744 Merciless Nether Drake
	[213] = {2, 406, 1}, -- 46628 Swift White Hawkstrider
	[219] = {2, 1802, 1}, -- 48025 Headless Horseman's Mount
	[220] = {2, 2804, 3}, -- 48027 Black War Elekk (Alliance)
	[223] = {2, 1303, 6}, -- 49193 Vengeful Nether Drake
	[226] = {2, 2503, 1}, -- 49379 Great Brewfest Kodo
	[241] = {2, 1303, 3}, -- 58615 Brutal Nether Drake
	[243] = {2, 600, 8}, -- 58983 Big Blizzard Bear
	[293] = {2, 1200, 1}, -- 62048 Black Dragonhawk Mount
	[1761] = {2, 2506, 8}, -- 348459 Reawakened Phase-Hunter
	[196] = {3, 708, 9}, -- 42776 Spectral Tiger
	[197] = {3, 708, 9}, -- 42777 Swift Spectral Tiger
	[211] = {3, 2916, 9}, -- 46197 X-51 Nether-Rocket
	[212] = {3, 2916, 9}, -- 46199 X-51 Nether-Rocket X-TREME
	[221] = {3, {901,1801}, 3}, -- 48778 Acherus Deathcharger
	[225] = {3, 2503, 7}, -- 49378 Brewfest Riding Kodo
	[230] = {3, 600, 9}, -- 51412 Big Battle Bear
	[236] = {3, 1500, 3}, -- 54729 Winged Steed of the Ebon Blade
	[237] = {3, 600, 1}, -- 54753 White Polar Bear
	[240] = {3, 2915, 4}, -- 55531 Mechano-Hog (Horde)
	[246] = {3, 1301, 1}, -- 59567 Azure Drake
	[247] = {3, 1301, 1}, -- 59568 Blue Drake
	[248] = {3, 1301, 1}, -- 59569 Bronze Drake
	[249] = {3, 1301, 3}, -- 59570 Red Drake
	[250] = {3, 1301, 1}, -- 59571 Twilight Drake
	[251] = {3, 600, 3}, -- 59572 Black Polar Bear
	[253] = {3, 1301, 1}, -- 59650 Black Drake
	[254] = {3, 2805, 3}, -- 59785 Black War Mammoth (Alliance)
	[255] = {3, 2805, 3}, -- 59788 Black War Mammoth (Horde)
	[256] = {3, 2805, 3}, -- 59791 Wooly Mammoth (Alliance)
	[257] = {3, 2805, 3}, -- 59793 Wooly Mammoth (Horde)
	[258] = {3, 2805, 3}, -- 59797 Ice Mammoth (Horde)
	[259] = {3, 2805, 3}, -- 59799 Ice Mammoth (Alliance)
	[262] = {3, 1305, 6}, -- 59961 Red Proto-Drake
	[263] = {3, 1305, 3}, -- 59976 Black Proto-Drake
	[264] = {3, 1305, 1}, -- 59996 Blue Proto-Drake
	[265] = {3, 1305, 1}, -- 60002 Time-Lost Proto-Drake
	[266] = {3, 1305, 6}, -- 60021 Plagued Proto-Drake
	[267] = {3, 1305, 6}, -- 60024 Violet Proto-Drake
	[268] = {3, 1301, 6}, -- 60025 Albino Drake
	[269] = {3, 600, 3}, -- 60114 Armored Brown Bear (Alliance)
	[270] = {3, 600, 3}, -- 60116 Armored Brown Bear (Horde)
	[271] = {3, 600, 6}, -- 60118 Black War Bear (Alliance)
	[272] = {3, 600, 6}, -- 60119 Black War Bear (Horde)
	[273] = {3, 2805, 3}, -- 60136 Grand Caravan Mammoth
	[274] = {3, 2805, 3}, -- 60140 Grand Caravan Mammoth
	[275] = {3, 2915, 4}, -- 60424 Mekgineer's Chopper (Alliance)
	[276] = {3, 1500, 3}, -- 61229 Armored Snowy Gryphon (Alliance)
	[277] = {3, 1504, 3}, -- 61230 Armored Blue Wind Rider (Horde)
	[278] = {3, 1305, 1}, -- 61294 Green Proto-Drake
	[279] = {3, 2905, 4}, -- 61309 Magnificent Flying Carpet
	[280] = {3, 2805, 3}, -- 61425 Traveler's Tundra Mammoth (Alliance)
	[284] = {3, 2805, 3}, -- 61447 Traveler's Tundra Mammoth (Horde)
	[285] = {3, 2905, 4}, -- 61451 Flying Carpet
	[286] = {3, 2805, 1}, -- 61465 Grand Black War Mammoth (Alliance)
	[287] = {3, 2805, 1}, -- 61467 Grand Black War Mammoth (Horde)
	[288] = {3, 2805, 3}, -- 61469 Grand Ice Mammoth (Horde)
	[289] = {3, 2805, 3}, -- 61470 Grand Ice Mammoth (Alliance)
	[291] = {3, 1200, 6}, -- 61996 Blue Dragonhawk (Alliance)
	[292] = {3, 1200, 6}, -- 61997 Red Dragonhawk (Horde)
	[294] = {3, 1806, 3}, -- 63232 Stormwind Steed (Alliance)
	[295] = {3, 1104, 3}, -- 63635 Darkspear Raptor (Horde)
	[296] = {3, 502, 3}, -- 63636 Ironforge Ram (Alliance)
	[297] = {3, 706, 3}, -- 63637 Darnassian Nightsaber (Alliance)
	[298] = {3, 2914, 3}, -- 63638 Gnomeregan Mechanostrider (Alliance)
	[299] = {3, 2804, 3}, -- 63639 Exodar Elekk (Alliance)
	[300] = {3, 3105, 3}, -- 63640 Orgrimmar Wolf (Horde)
	[301] = {3, 2503, 3}, -- 63641 Thunder Bluff Kodo (Horde)
	[302] = {3, 406, 3}, -- 63642 Silvermoon Hawkstrider (Horde)
	[303] = {3, 1807, 3}, -- 63643 Forsaken Warhorse (Horde)
	[304] = {3, 2907, 1}, -- 63796 Mimiron's Head
	[305] = {3, 1501, 3}, -- 63844 Argent Hippogryph
	[306] = {3, 1305, 6}, -- 63956 Ironbound Proto-Drake
	[307] = {3, 1305, 6}, -- 63963 Rusted Proto-Drake
	[308] = {3, 1807, 3}, -- 64656 Blue Skeletal Warhorse
	[309] = {3, 2503, 3}, -- 64657 White Kodo (Horde)
	[310] = {3, 3105, 3}, -- 64658 Black Wolf (Horde)
	[311] = {3, 1104, 2}, -- 64659 Venomhide Ravasaur (Horde)
	[312] = {3, 2511, 4}, -- 64731 Sea Turtle
	[313] = {3, 1307, 3}, -- 64927 Deadly Gladiator's Frost Wyrm
	[314] = {3, 1807, 3}, -- 64977 Black Skeletal Horse (Horde)
	[317] = {3, 1307, 3}, -- 65439 Furious Gladiator's Frost Wyrm
	[318] = {3, 2804, 3}, -- 65637 Great Red Elekk (Alliance)
	[319] = {3, 706, 3}, -- 65638 Swift Moonsaber (Alliance)
	[320] = {3, 406, 3}, -- 65639 Swift Red Hawkstrider (Horde)
	[321] = {3, 1806, 3}, -- 65640 Swift Gray Steed (Alliance)
	[322] = {3, 2503, 3}, -- 65641 Great Golden Kodo (Horde)
	[323] = {3, 2914, 3}, -- 65642 Turbostrider (Alliance)
	[324] = {3, 502, 3}, -- 65643 Swift Violet Ram (Alliance)
	[325] = {3, 1104, 3}, -- 65644 Swift Purple Raptor (Horde)
	[326] = {3, 1807, 3}, -- 65645 White Skeletal Warhorse (Horde)
	[327] = {3, 3105, 3}, -- 65646 Swift Burgundy Wolf (Horde)
	[328] = {3, 401, 9}, -- 65917 Magic Rooster
	[329] = {3, 1501, 3}, -- 66087 Silver Covenant Hippogryph (Alliance)
	[330] = {3, 1200, 3}, -- 66088 Sunreaver Dragonhawk (Horde)
	[331] = {3, 1803, 3}, -- 66090 Quel'dorei Steed (Alliance)
	[332] = {3, 406, 3}, -- 66091 Sunreaver Hawkstrider (Horde)
	[333] = {3, 401, 9}, -- 66122 Magic Rooster
	[334] = {3, 401, 9}, -- 66123 Magic Rooster
	[335] = {3, 401, 9}, -- 66124 Magic Rooster
	[336] = {3, 1807, 3}, -- 66846 Ochre Skeletal Warhorse (Horde)
	[337] = {3, 706, 3}, -- 66847 Striped Dawnsaber (Alliance)
	[338] = {3, 1800, 3}, -- 66906 Argent Charger
	[340] = {3, 1307, 6}, -- 67336 Relentless Gladiator's Frost Wyrm
	[341] = {3, 1800, 3}, -- 67466 Argent Warhorse
	[342] = {3, 3105, 3}, -- 68056 Swift Horde Wolf (Horde)
	[343] = {3, 1806, 3}, -- 68057 Swift Alliance Steed (Alliance)
	[344] = {3, 1800, 6}, -- 68187 Crusader's White Warhorse (Alliance)
	[345] = {3, 1800, 6}, -- 68188 Crusader's Black Warhorse (Horde)
	[349] = {3, 1301, 1}, -- 69395 Onyxian Drake
	[352] = {3, 2916, 1}, -- 71342 X-45 Heartbreaker
	[358] = {3, 1307, 6}, -- 71810 Wrathful Gladiator's Frost Wyrm
	[363] = {3, 1802, 1}, -- 72286 Invincible
	[364] = {3, 1307, 6}, -- 72807 Icebound Frostbrood Vanquisher
	[365] = {3, 1307, 6}, -- 72808 Bloodbathed Frostbrood Vanquisher
	[366] = {3, {901,1801}, 2}, -- 73313 Crimson Deathcharger
	[371] = {3, 1501, 9}, -- 74856 Blazing Hippogryph
	[372] = {3, 2808, 9}, -- 74918 Wooly White Rhino
	[375] = {3, 2905, 4}, -- 75596 Frosty Flying Carpet
	[1762] = {3, 2911, 8}, -- 372677 Kalu'ak Whalebone Glider
	[1763] = {3, 401, 9}, -- 387308 Magic Rooster
	[1764] = {3, 2916, 9}, -- 387311 X-51 Nether-Rocket X-TREME
	[1765] = {3, 600, 9}, -- 387319 Big Battle Bear
	[1766] = {3, 1501, 9}, -- 387320 Blazing Hippogryph
	[1767] = {3, 2808, 9}, -- 387321 Wooly White Rhino
	[1768] = {3, 2916, 9}, -- 387323 X-51 Nether-Rocket
	[1769] = {3, 2600, 10}, -- 388516 Hao-Yue, River Foreseer
	[1770] = {3, 1307, 8}, -- 394209 Festering Emerald Drake
	[1807] = {3, 1401, 8}, -- 423869 Avatar of Flame
	[1823] = {3, 1500, 6}, -- 55164 Swift Spectral Gryphon
	[1832] = {3, 1301, 8}, -- 416158 Nightmarish Emerald Drake
	[1806] = {4, 1301, 10}, -- 440915 Auspicious Arborwyrm
	[1843] = {4, 706, 6}, -- 10790 Tiger
	[1869] = {4, 2503, 2}, -- 69820 Summon Sunwalker Kodo (Horde)
	[1870] = {4, 2503, 2}, -- 69826 Summon Great Sunwalker Kodo (Horde)
	[1871] = {4, 2804, 2}, -- 73629 Summon Exarch's Elekk (Alliance)
	[1872] = {4, 2804, 2}, -- 73630 Summon Great Exarch's Elekk (Alliance)
	[1873] = {4, 1601, 2}, -- 75207 Abyssal Seahorse
	[1875] = {4, 1104, 4}, -- 84751 Fossilized Raptor
	[1877] = {4, 2915, 3}, -- 87090 Goblin Trike
	[1878] = {4, 2915, 3}, -- 87091 Goblin Turbo-Trike
	[1880] = {4, {1306,1405}, 6}, -- 88331 Volcanic Stone Drake
	[1881] = {4, {1308,1406}, 6}, -- 88335 Drake of the East Wind
	[1882] = {4, {1306,1405}, 1}, -- 88718 Phosphorescent Stone Drake
	[1883] = {4, {1308,1406}, 3}, -- 88741 Drake of the West Wind
	[1884] = {4, {1308,1406}, 1}, -- 88742 Drake of the North Wind
	[1885] = {4, {1308,1406}, 1}, -- 88744 Drake of the South Wind
	[1886] = {4, {1306,1405}, 1}, -- 88746 Vitreous Stone Drake
	[1887] = {4, 2802, 3}, -- 88748 Brown Riding Camel
	[1888] = {4, 2802, 3}, -- 88749 Tan Riding Camel
	[1889] = {4, 2802, 1}, -- 88750 Grey Riding Camel
	[1890] = {4, {410,1402}, 3}, -- 88990 Dark Phoenix
	[1892] = {4, 702, 3}, -- 90621 Golden King (Alliance)
	[1893] = {4, 2008, 4}, -- 92155 Ultramarine Qiraji Battle Tank
	[1894] = {4, 1807, 3}, -- 92231 Spectral Steed (Alliance)
	[1895] = {4, 3102, 3}, -- 92232 Spectral Wolf (Horde)
	[1896] = {4, {1306,1405}, 4}, -- 93326 Sandstone Drake
	[1897] = {4, 1301, 9}, -- 93623 Mottled Drake
	[1898] = {4, 201, 3}, -- 93644 Kor'kron Annihilator (Horde)
	[1899] = {4, 1104, 1}, -- 96491 Armored Razzashi Raptor
	[1900] = {4, 706, 1}, -- 96499 Swift Zulian Panther
	[1901] = {4, 1200, 9}, -- 96503 Amani Dragonhawk
	[1902] = {4, 1501, 6}, -- 97359 Flameward Hippogryph
	[1904] = {4, {413,1402}, 1}, -- 97493 Pureblood Fire Hawk
	[1905] = {4, {413,1402}, 6}, -- 97501 Green Fire Hawk
	[1906] = {4, {413,1402}, 6}, -- 97560 Corrupted Fire Hawk
	[1907] = {4, 1104, 9}, -- 97581 Savage Raptor
	[1908] = {4, 600, 1}, -- 98204 Amani Battle Bear
	[1909] = {4, 1601, 1}, -- 98718 Subdued Seahorse
	[1910] = {4, {702,707}, 10}, -- 98727 Winged Guardian
	[1911] = {4, 1800, 6}, -- 100332 Vicious War Steed (Alliance)
	[1912] = {4, 3103, 6}, -- 100333 Vicious War Wolf (Horde)
	[1913] = {4, 1301, 6}, -- 101282 Vicious Gladiator's Twilight Drake
	[1914] = {4, 417, 1}, -- 101542 Flametalon of Alysrazor
	[1915] = {4, 416, 9}, -- 101573 Swift Shorestrider
	[1917] = {4, 1301, 6}, -- 101821 Ruthless Gladiator's Twilight Drake
	[1918] = {4, 416, 3}, -- 102346 Swift Forest Strider
	[1919] = {4, 416, 7}, -- 102349 Swift Springstrider
	[1920] = {4, 416, 7}, -- 102350 Swift Lovebird
	[1921] = {4, 2802, 9}, -- 102488 White Riding Camel
	[1922] = {4, 1501, 9}, -- 102514 Corrupted Hippogryph
	[1923] = {4, 600, 3}, -- 103081 Darkmoon Dancing Bear
	[1924] = {4, 1806, 3}, -- 103195 Mountain Horse
	[1925] = {4, 1806, 3}, -- 103196 Swift Mountain Horse
	[1928] = {4, 1802, 3}, -- 107203 Tyrael's Charger
	[1929] = {4, 1500, 8}, -- 107516 Spectral Gryphon (Alliance)
	[1930] = {4, 1504, 8}, -- 107517 Spectral Wind Rider (Horde)
	[1931] = {4, 1302, 1}, -- 107842 Blazing Drake
	[1932] = {4, 1302, 6}, -- 107844 Twilight Harbinger
	[1933] = {4, 1302, 1}, -- 107845 Life-Binder's Handmaiden
	[1934] = {4, 1301, 1}, -- 110039 Experiment 12-B
	[1935] = {4, 1304, 10}, -- 110051 Heart of the Aspects
	[1936] = {4, 1301, 9}, -- 113120 Feldrake
	[1937] = {4, 707, 8}, -- 121820 Obsidian Nightwing
	[2147] = {4, 411, 1}, -- 446902 Polly Roger
}, {
	__index = function(self, key)
		self[key] = {tonumber(GetBuildInfo():match("(.-)%.")), 0, 0}
		return self[key]
	end
})