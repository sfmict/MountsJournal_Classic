local mounts = MountsJournal


mounts.itemIDToSpellID = {
	[1132] = 580,
	[1133] = 581,
	[1134] = 459,
	[2411] = 470,
	[2413] = 471,
	[2414] = 472,
	[2415] = 468,
	[5655] = 6648,
	[5656] = 458,
	[5663] = 579,
	[5665] = 6653,
	[5668] = 6654,
	[5864] = 6777,
	[5872] = 6899,
	[5873] = 6898,
	[5874] = 6896,
	[5875] = 6897,
	[8563] = 10873,
	[8583] = 8980,
	[8586] = 16084,
	[8588] = 8395,
	[8589] = 10795,
	[8590] = 10798,
	[8591] = 10796,
	[8592] = 10799,
	[8595] = 10969,
	[8627] = 10787,
	[8628] = 10792,
	[8629] = 10793,
	[8630] = 10790,
	[8631] = 8394,
	[8632] = 10789,
	[8633] = 10788,
	[12302] = 16056,
	[12303] = 16055,
	[12325] = 16058,
	[12326] = 16059,
	[12327] = 16060,
	[12330] = 16080,
	[12351] = 16081,
	[12353] = 16083,
	[12354] = 16082,
	[13086] = 17229,
	[13317] = 17450,
	[13321] = 17453,
	[13322] = 17454,
	[13323] = 17455,
	[13324] = 17456,
	[13325] = 17458,
	[13326] = 15779,
	[13327] = 17459,
	[13328] = 17461,
	[13329] = 17460,
	[13331] = 17462,
	[13332] = 17463,
	[13333] = 17464,
	[13334] = 17465,
	[13335] = 17481,
	[14062] = 18363,
	[15277] = 18989,
	[15290] = 18990,
	[15292] = 18991,
	[15293] = 18992,
	[16338] = 458,
	[16339] = 16082,
	[16343] = 6654,
	[18241] = 22717,
	[18242] = 22723,
	[18243] = 22719,
	[18244] = 22720,
	[18245] = 22724,
	[18246] = 22721,
	[18247] = 22718,
	[18248] = 22722,
	[18766] = 23221,
	[18767] = 23219,
	[18768] = 23220,
	[18772] = 23225,
	[18773] = 23223,
	[18774] = 23222,
	[18776] = 23227,
	[18777] = 23229,
	[18778] = 23228,
	[18785] = 23240,
	[18786] = 23238,
	[18787] = 23239,
	[18788] = 23241,
	[18789] = 23242,
	[18790] = 23243,
	[18791] = 23246,
	[18793] = 23247,
	[18794] = 23249,
	[18795] = 23248,
	[18796] = 23250,
	[18797] = 23251,
	[18798] = 23252,
	[18902] = 23338,
	[19029] = 23509,
	[19030] = 23510,
	[19872] = 24242,
	[19902] = 24252,
	[21176] = 26656,
	[21218] = 25953,
	[21321] = 26054,
	[21323] = 26056,
	[21324] = 26055,
	[23193] = 29059,
	[23720] = 30174,
	[25470] = 32235,
	[25471] = 32239,
	[25472] = 32240,
	[25473] = 32242,
	[25474] = 32243,
	[25475] = 32244,
	[25476] = 32245,
	[25477] = 32246,
	[25527] = 32289,
	[25528] = 32290,
	[25529] = 32292,
	[25531] = 32295,
	[25532] = 32296,
	[25533] = 32297,
	[25596] = 32345,
	[28481] = 34406,
	[28482] = 34407,
	[28915] = 39316,
	[28927] = 34795,
	[28936] = 33660,
	[29102] = 34896,
	[29103] = 34897,
	[29104] = 34898,
	[29105] = 34899,
	[29220] = 35020,
	[29221] = 35022,
	[29222] = 35018,
	[29223] = 35025,
	[29224] = 35027,
	[29227] = 34896,
	[29228] = 34790,
	[29229] = 34898,
	[29230] = 34899,
	[29231] = 34897,
	[29465] = 22719,
	[29466] = 22718,
	[29467] = 22720,
	[29468] = 22717,
	[29469] = 22724,
	[29470] = 22722,
	[29471] = 22723,
	[29472] = 22721,
	[29743] = 35711,
	[29744] = 35710,
	[29745] = 35713,
	[29746] = 35712,
	[29747] = 35714,
	[30480] = 36702,
	[30609] = 37015,
	[31829] = 39315,
	[31830] = 39315,
	[31831] = 39317,
	[31832] = 39317,
	[31833] = 39318,
	[31834] = 39318,
	[31835] = 39319,
	[31836] = 39319,
	[32314] = 39798,
	[32316] = 39801,
	[32317] = 39800,
	[32318] = 39802,
	[32319] = 39803,
	[32458] = 40192,
	[32768] = 41252,
	[32857] = 41513,
	[32858] = 41514,
	[32859] = 41515,
	[32860] = 41516,
	[32861] = 41517,
	[32862] = 41518,
	[33224] = 42776,
	[33225] = 42777,
	[33809] = 43688,
	[33976] = 43899,
	[33977] = 43900,
	[33999] = 43927,
	[34060] = 44153,
	[34061] = 44151,
	[34092] = 44744,
	[34129] = 35028,
	[35225] = 46197,
	[35226] = 46199,
	[35513] = 46628,
	[35906] = 48027,
	[37012] = 48025,
	[37598] = 48954,
	[37676] = 49193,
	[37719] = 49322,
	[37827] = 49378,
	[37828] = 49379,
	[38576] = 51412,
	[40775] = 54729,
	[40777] = 54753,
	[41508] = 55531,
	[43516] = 58615,
	[43599] = 58983,
	[43951] = 59569,
	[43952] = 59567,
	[43953] = 59568,
	[43954] = 59571,
	[43955] = 59570,
	[43956] = 59785,
	[43958] = 59799,
	[43959] = 61465,
	[43961] = 61470,
	[43962] = 54753,
	[43963] = 59573,
	[43964] = 59572,
	[43986] = 59650,
	[44077] = 59788,
	[44080] = 59797,
	[44083] = 61467,
	[44086] = 61469,
	[44151] = 59996,
	[44160] = 59961,
	[44164] = 59976,
	[44168] = 60002,
	[44175] = 60021,
	[44177] = 60024,
	[44178] = 60025,
	[44223] = 60118,
	[44224] = 60119,
	[44225] = 60114,
	[44226] = 60116,
	[44230] = 59791,
	[44231] = 59793,
	[44234] = 61447,
	[44235] = 61425,
	[44413] = 60424,
	[44554] = 61451,
	[44555] = 61442,
	[44556] = 61446,
	[44557] = 61444,
	[44558] = 61309,
	[44689] = 61229,
	[44690] = 61230,
	[44707] = 61294,
	[44842] = 61997,
	[44843] = 61996,
	[45125] = 63232,
	[45586] = 63636,
	[45589] = 63638,
	[45590] = 63639,
	[45591] = 63637,
	[45592] = 63641,
	[45593] = 63635,
	[45595] = 63640,
	[45596] = 63642,
	[45597] = 63643,
	[45693] = 63796,
	[45725] = 63844,
	[45801] = 63956,
	[45802] = 63963,
	[46099] = 64658,
	[46100] = 64657,
	[46101] = 64656,
	[46102] = 64659,
	[46109] = 64731,
	[46171] = 65439,
	[46308] = 64977,
	[46708] = 64927,
	[46743] = 65644,
	[46744] = 65638,
	[46745] = 65637,
	[46746] = 65645,
	[46747] = 65642,
	[46748] = 65643,
	[46749] = 65646,
	[46750] = 65641,
	[46751] = 65639,
	[46752] = 65640,
	[46755] = 65641,
	[46756] = 65637,
	[46757] = 65646,
	[46758] = 65640,
	[46759] = 65638,
	[46760] = 65644,
	[46761] = 65639,
	[46762] = 65643,
	[46763] = 65642,
	[46764] = 65645,
	[46778] = 65917,
	[46813] = 66087,
	[46814] = 66088,
	[46815] = 66090,
	[46816] = 66091,
	[47100] = 66847,
	[47101] = 66846,
	[47179] = 66906,
	[47180] = 67466,
	[47840] = 67336,
	[49044] = 68057,
	[49046] = 68056,
	[49096] = 68187,
	[49098] = 68188,
	[49282] = 51412,
	[49283] = 42776,
	[49284] = 42777,
	[49285] = 46197,
	[49286] = 46199,
	[49290] = 65917,
	[49636] = 69395,
	[50250] = 71342,
	[50420] = 10799,
	[50435] = 71810,
	[50818] = 72286,
	[51954] = 72808,
	[51955] = 72807,
	[52200] = 73313,
	[54068] = 74918,
	[54069] = 74856,
	[54797] = 75596,
	[54811] = 75614,
	[54860] = 75973,
	[74269] = 74856,
	[103630] = 30174,
	[184865] = 348459,
	[192455] = 372677,
	[198628] = 387311,
	[198629] = 387323,
	[198630] = 387320,
	[198631] = 387308,
	[198632] = 387319,
	[198633] = 387321,
	[201699] = 394209,
}


mounts.mountsDB = {
	-- spellID, creatureID, mountType, sourceType, mountFaction, expansion
	{458, 2404, 2, 3, 2, 1}, -- Гнедой конь
	{459, 2320, 2, 3, 3, 1}, -- Серый волк
	{468, 2410, 2, 3, 3, 1}, -- Белый жеребец
	{470, 2402, 2, 3, 2, 1}, -- Вороной жеребец
	{472, 2409, 2, 3, 2, 1}, -- Пегий конь
	{578, 207, 2, 3, 3, 1}, -- Черный волк
	{579, 2326, 2, 3, 3, 1}, -- Рыжий волк
	{580, 247, 2, 3, 1, 1}, -- Лесной волк
	{581, 1166, 2, 3, 3, 1}, -- Снежный волк
	{5784, 2346, 2, 2, 3, 1}, -- Конь Скверны
	{6648, 2405, 2, 3, 2, 1}, -- Гнедая кобыла
	{6653, 2327, 2, 3, 1, 1}, -- Лютый волк
	{6654, 2328, 2, 3, 1, 1}, -- Темно-бурый волк
	{6777, 2736, 2, 3, 2, 1}, -- Серый баран
	{6896, 2784, 2, 3, 3, 1}, -- Черный баран
	{6898, 2786, 2, 3, 2, 1}, -- Белый баран
	{6899, 2785, 2, 3, 2, 1}, -- Бурый баран
	{8394, 6080, 2, 3, 2, 1}, -- Полосатый ледопард
	{8395, 4806, 2, 3, 1, 1}, -- Изумрудный ящер
	{8980, 5228, 2, 3, 3, 1}, -- Конь-скелет
	{10789, 6444, 2, 3, 2, 1}, -- Пятнистый ледопард
	{10790, 6443, 2, 0, 3, 1}, -- Тигр
	{10793, 6448, 2, 3, 2, 1}, -- Полосатый ночной саблезуб
	{10795, 6471, 2, 3, 3, 1}, -- Палевый ящер
	{10796, 6472, 2, 3, 1, 1}, -- Бирюзовый ящер
	{10799, 6473, 2, 3, 1, 1}, -- Фиолетовый ящер
	{10873, 9473, 2, 3, 2, 1}, -- Красный механодолгоног
	{10969, 6569, 2, 3, 2, 1}, -- Синий механодолгоног
	{13819, 8469, 2, 2, 2, 1}, -- Боевой конь
	{15779, 9474, 2, 3, 2, 1}, -- Белый механодолгоног модель Б
	{15780, 9475, 2, 3, 3, 1}, -- Зеленый механодолгоног
	{16055, 9991, 2, 3, 2, 1}, -- Черный ночной саблезуб
	{16056, 9695, 2, 3, 2, 1}, -- Древний ледопард
	{16080, 2326, 2, 3, 1, 1}, -- Рыжий волк
	{16081, 1166, 2, 1, 1, 1}, -- Полярный волк
	{16082, 2408, 2, 3, 2, 1}, -- Игреневый конь
	{16083, 2410, 2, 3, 2, 1}, -- Белый жеребец
	{16084, 6469, 2, 3, 1, 1}, -- Крапчатый красный ящер
	{17229, 10426, 2, 2, 2, 1}, -- Ледопард Зимних Ключей
	{17450, 6471, 2, 3, 1, 1}, -- Палевый ящер
	{17453, 10661, 2, 3, 2, 1}, -- Зеленый механодолгоног
	{17454, 9476, 2, 3, 2, 1}, -- Некрашеный механодолгоног
	{17459, 10666, 2, 3, 2, 1}, -- Льдисто-синий механодолгоног модель А
	{17460, 2787, 2, 3, 2, 1}, -- Снежный баран
	{17461, 2784, 2, 3, 2, 1}, -- Черный баран
	{17462, 10670, 2, 3, 1, 1}, -- Красный конь-скелет
	{17463, 10671, 2, 3, 1, 1}, -- Синий конь-скелет
	{17464, 10672, 2, 3, 1, 1}, -- Гнедой конь-скелет
	{17465, 10720, 2, 3, 1, 1}, -- Зеленый боевой конь-скелет
	{17481, 10718, 2, 1, 3, 1}, -- Конь смерти Ривендера
	{18363, 11641, 2, 3, 3, 1}, -- Верховой кодо
	{18989, 12246, 2, 3, 1, 1}, -- Серый кодо
	{18990, 11641, 2, 3, 1, 1}, -- Бурый кодо
	{18991, 12245, 2, 3, 1, 1}, -- Зеленый кодо
	{18992, 12242, 2, 3, 1, 1}, -- Бирюзовый кодо
	{23161, 14554, 2, 2, 3, 1}, -- Скакун погибели
	{23214, 14584, 2, 2, 2, 1}, -- Скакун
	{23219, 14332, 2, 3, 2, 1}, -- Стремительный туманный саблезуб
	{23221, 14331, 2, 3, 2, 1}, -- Стремительный ледопард
	{23222, 14377, 2, 3, 2, 1}, -- Стремительный желтый механодолгоног
	{23223, 14376, 2, 3, 2, 1}, -- Стремительный белый механодолгоног
	{23225, 14374, 2, 3, 2, 1}, -- Стремительный зеленый механодолгоног
	{23227, 14582, 2, 3, 2, 1}, -- Стремительный игреневый конь
	{23228, 14338, 2, 3, 2, 1}, -- Стремительный белый рысак
	{23229, 14583, 2, 3, 2, 1}, -- Стремительный гнедой рысак
	{23238, 14347, 2, 3, 2, 1}, -- Стремительный бурый баран
	{23239, 14576, 2, 3, 2, 1}, -- Стремительный серый баран
	{23240, 14346, 2, 3, 2, 1}, -- Стремительный белый баран
	{23241, 14339, 2, 3, 1, 1}, -- Стремительный синий ящер
	{23242, 14344, 2, 3, 1, 1}, -- Стремительный оливковый ящер
	{23243, 14342, 2, 3, 1, 1}, -- Стремительный оранжевый ящер
	{23246, 10721, 2, 3, 1, 1}, -- Лиловый боевой конь-скелет
	{23247, 14349, 2, 3, 1, 1}, -- Огромный белый кодо
	{23248, 14579, 2, 3, 1, 1}, -- Огромный серый кодо
	{23249, 14578, 2, 3, 1, 1}, -- Огромный бурый кодо
	{23250, 14573, 2, 3, 1, 1}, -- Стремительный бурый волк
	{23251, 14575, 2, 3, 1, 1}, -- Стремительный лесной волк
	{23252, 14574, 2, 3, 1, 1}, -- Стремительный серый волк
	{23338, 14632, 2, 3, 2, 1}, -- Стремительный грозовой саблезуб
	{23509, 14776, 2, 3, 1, 1}, -- Верховой северный волк
	{23510, 14777, 2, 3, 2, 1}, -- Боевой скакун клана Грозовой Вершины
	{24242, 15289, 2, 1, 3, 1}, -- Стремительный ящер Раззаши
	{24252, 15290, 2, 1, 3, 1}, -- Стремительный зульский тигр
	{25863, 15676, 2, 1, 3, 1}, -- Черный киражский боевой танк
	{25953, 15672, 2, 1, 3, 1}, -- Синий киражский боевой танк
	{26054, 15681, 2, 1, 3, 1}, -- Красный киражский боевой танк
	{26055, 15680, 2, 1, 3, 1}, -- Желтый киражский боевой танк
	{26056, 15679, 2, 1, 3, 1}, -- Зеленый киражский боевой танк
	{26655, 15676, 2, 1, 3, 1}, -- Черный киражский боевой танк
	{26656, 15676, 2, 1, 3, 1}, -- Черный киражский боевой танк
	{33630, 6569, 2, 3, 3, 1}, -- Синий механодолгоног
	{22717, 14337, 2, 3, 2, 2}, -- Вороной боевой скакун
	{22718, 14348, 2, 3, 1, 2}, -- Черный боевой кодо
	{22719, 14372, 2, 3, 2, 2}, -- Черный боевой механодолгоног
	{22720, 14577, 2, 3, 2, 2}, -- Черный боевой баран
	{22721, 14388, 2, 3, 1, 2}, -- Черный боевой ящер
	{22722, 10719, 2, 3, 1, 2}, -- Красный боевой конь-скелет
	{22723, 14330, 2, 3, 2, 2}, -- Черный боевой саблезуб
	{22724, 14334, 2, 3, 1, 2}, -- Черный боевой волк
	{28828, 16314, 1, 3, 3, 2}, -- Дракон Пустоты
	{30174, 17158, 3, 9, 3, 2}, -- Верховая черепаха
	{32235, 17697, 1, 3, 2, 2}, -- Золотистый грифон
	{32239, 17694, 1, 3, 2, 2}, -- Вороной грифон
	{32240, 17696, 1, 3, 2, 2}, -- Белоснежный грифон
	{32242, 17759, 1, 3, 2, 2}, -- Стремительный синий грифон
	{32243, 17699, 1, 3, 1, 2}, -- Рыжий ветрокрыл
	{32244, 17700, 1, 3, 1, 2}, -- Синий ветрокрыл
	{32245, 17701, 1, 1, 1, 2}, -- Зеленый ветрокрыл
	{32246, 17719, 1, 3, 1, 2}, -- Стремительный красный ветрокрыл
	{32289, 17718, 1, 3, 2, 2}, -- Стремительный красный грифон
	{32290, 17703, 1, 3, 2, 2}, -- Стремительный зеленый грифон
	{32292, 17717, 1, 3, 2, 2}, -- Стремительный лиловый грифон
	{32295, 17720, 1, 3, 1, 2}, -- Стремительный зеленый ветрокрыл
	{32296, 17722, 1, 3, 1, 2}, -- Стремительный желтый ветрокрыл
	{32297, 17721, 1, 3, 1, 2}, -- Стремительный лиловый ветрокрыл
	{33660, 18697, 2, 3, 1, 2}, -- Стремительный розовый крылобег
	{34406, 17063, 2, 3, 2, 2}, -- Бурый элекк
	{34767, 19085, 2, 2, 1, 2}, -- Кель'таласский скакун
	{34769, 19296, 2, 2, 1, 2}, -- Кель'таласский боевой конь
	{34790, 19303, 2, 3, 3, 2}, -- Черный боевой талбук
	{34795, 18696, 2, 3, 1, 2}, -- Красный крылобег
	{34896, 19375, 2, 3, 3, 2}, -- Кобальтовый боевой талбук
	{34897, 19377, 2, 3, 3, 2}, -- Белый боевой талбук
	{34898, 19378, 2, 3, 3, 2}, -- Серебристый боевой талбук
	{34899, 19376, 2, 3, 3, 2}, -- Рыжий боевой талбук
	{35018, 19479, 2, 3, 1, 2}, -- Лиловый крылобег
	{35020, 19480, 2, 3, 1, 2}, -- Синий крылобег
	{35022, 19478, 2, 3, 1, 2}, -- Черный крылобег
	{35025, 19484, 2, 3, 1, 2}, -- Стремительный зеленый крылобег
	{35027, 19482, 2, 3, 1, 2}, -- Стремительный лиловый крылобег
	{35028, 20359, 2, 3, 1, 2}, -- Стремительный боевой крылобег
	{35710, 19869, 2, 3, 2, 2}, -- Серый элекк
	{35711, 19870, 2, 3, 2, 2}, -- Лиловый элекк
	{35712, 19873, 2, 3, 2, 2}, -- Большой зеленый элекк
	{35713, 19871, 2, 3, 2, 2}, -- Большой синий элекк
	{35714, 19872, 2, 3, 2, 2}, -- Большой лиловый элекк
	{36702, 19250, 2, 1, 3, 2}, -- Огненный боевой конь
	{37015, 20344, 1, 6, 3, 2}, -- Стремительный дракон Пустоты
	{39315, 21073, 2, 3, 3, 2}, -- Кобальтовый верховой талбук
	{39316, 21074, 2, 3, 3, 2}, -- Черный верховой талбук
	{39317, 21075, 2, 3, 3, 2}, -- Серебристый верховой талбук
	{39318, 21077, 2, 3, 3, 2}, -- Рыжий верховой талбук
	{39319, 21076, 2, 3, 3, 2}, -- Белый верховой талбук
	{39798, 21152, 1, 3, 3, 2}, -- Зеленый верховой скат Пустоты
	{39800, 21158, 1, 3, 3, 2}, -- Красный верховой скат Пустоты
	{39801, 21155, 1, 3, 3, 2}, -- Лиловый верховой скат Пустоты
	{39802, 21157, 1, 3, 3, 2}, -- Серебряный верховой скат Пустоты
	{39803, 21156, 1, 3, 3, 2}, -- Синий верховой скат Пустоты
	{40192, 17890, 1, 1, 3, 2}, -- Пепел Ал'ара
	{41252, 21473, 2, 1, 3, 2}, -- Повелитель воронов
	{41513, 21520, 1, 2, 3, 2}, -- Ониксовый дракон Крыльев Пустоты
	{41514, 21521, 1, 2, 3, 2}, -- Лазурный дракон Крыльев Пустоты
	{41515, 21525, 1, 2, 3, 2}, -- Кобальтовый дракон Крыльев Пустоты
	{41516, 21523, 1, 2, 3, 2}, -- Лиловый дракон Крыльев Пустоты
	{41517, 21522, 1, 2, 3, 2}, -- Зеленый дракон Крыльев Пустоты
	{41518, 21524, 1, 2, 3, 2}, -- Фиолетовый дракон Крыльев Пустоты
	{43688, 22464, 2, 1, 3, 2}, -- Аманийский боевой медведь
	{43899, 22265, 2, 7, 3, 2}, -- Баран Хмельного фестиваля
	{43900, 22350, 2, 1, 3, 2}, -- Стремительный баран Хмельного фестиваля
	{43927, 22473, 1, 3, 3, 2}, -- Кенарийский боевой гиппогриф
	{44151, 22720, 1, 4, 3, 2}, -- Турбоветролет
	{44153, 22719, 1, 4, 3, 2}, -- Ветролет
	{44317, 20344, 1, 6, 3, 2}, -- Безжалостный дракон Пустоты
	{44744, 22620, 1, 6, 3, 2}, -- Безжалостный дракон Пустоты
	{46628, 19483, 2, 1, 3, 2}, -- Стремительный белый крылобег
	{48025, 25159, 1, 1, 3, 2}, -- Скакун Всадника без головы
	{48027, 23928, 2, 3, 2, 2}, -- Черный боевой элекк
	{48954, 24693, 2, 8, 3, 2}, -- Стремительная жевра
	{49193, 24725, 1, 6, 3, 2}, -- Мстительный дракон Пустоты
	{49322, 24745, 2, 8, 3, 2}, -- Стремительная жевра
	{49379, 24757, 2, 1, 3, 2}, -- Большой кодо Хмельного фестиваля
	{58615, 27507, 1, 3, 3, 2}, -- Жестокий дракон Пустоты
	{58983, 27567, 2, 8, 3, 2}, -- Большой медведь Blizzard
	{62048, 28417, 1, 1, 3, 2}, -- Иллидарский Предвестник Рока
	{42776, 21973, 2, 9, 3, 3}, -- Призрачный тигр
	{42777, 21974, 2, 9, 3, 3}, -- Стремительный призрачный тигр
	{46197, 23656, 1, 9, 3, 3}, -- Ракета Пустоты X-51
	{46199, 23647, 1, 9, 3, 3}, -- ИКС-ключительная ракета Пустоты X-51
	{48778, 25280, 2, 3, 3, 3}, -- Конь смерти Акеруса
	{49378, 24758, 2, 7, 3, 3}, -- Верховой кодо Хмельного фестиваля
	{51412, 25335, 2, 9, 3, 3}, -- Большой боевой медведь
	{54729, 28108, 1, 3, 3, 3}, -- Крылатый скакун Черного Клинка
	{54753, 28428, 2, 1, 3, 3}, -- Белый северный медведь
	{55164, 26691, 1, 6, 3, 3}, -- Стремительный призрачный грифон
	{55531, 25871, 2, 4, 1, 3}, -- Механоцикл
	{59567, 27785, 1, 1, 3, 3}, -- Лазурный дракон
	{59568, 25832, 1, 1, 3, 3}, -- Синий дракон
	{59569, 25833, 1, 1, 3, 3}, -- Бронзовый дракон
	{59570, 25835, 1, 3, 3, 3}, -- Красный дракон
	{59571, 27796, 1, 1, 3, 3}, -- Сумеречный дракон
	{59572, 27659, 2, 3, 3, 3}, -- Черный северный медведь
	{59650, 25831, 1, 1, 3, 3}, -- Черный дракон
	{59785, 27247, 2, 3, 2, 3}, -- Черный боевой мамонт
	{59788, 27245, 2, 3, 1, 3}, -- Черный боевой мамонт
	{59791, 27243, 2, 3, 2, 3}, -- Шерстистый мамонт
	{59793, 27244, 2, 3, 1, 3}, -- Шерстистый мамонт
	{59797, 27246, 2, 3, 1, 3}, -- Ледяной мамонт
	{59799, 27248, 2, 3, 2, 3}, -- Ледяной мамонт
	{59961, 28044, 1, 6, 3, 3}, -- Красный протодракон
	{59976, 28040, 1, 3, 3, 3}, -- Черный протодракон
	{59996, 28041, 1, 1, 3, 3}, -- Синий протодракон
	{60002, 28045, 1, 1, 3, 3}, -- Затерянный во времени протодракон
	{60021, 28042, 1, 6, 3, 3}, -- Чумной протодракон
	{60024, 28043, 1, 6, 3, 3}, -- Аметистовый протодракон
	{60025, 25836, 1, 6, 3, 3}, -- Дракон-альбинос
	{60114, 27820, 2, 3, 2, 3}, -- Бронированный бурый медведь
	{60116, 27821, 2, 3, 1, 3}, -- Бронированный бурый медведь
	{60118, 27818, 2, 6, 2, 3}, -- Черный боевой медведь
	{60119, 27819, 2, 6, 1, 3}, -- Черный боевой медведь
	{60136, 27237, 2, 3, 3, 3}, -- Большой караванный мамонт
	{60140, 27238, 2, 3, 3, 3}, -- Большой караванный мамонт
	{60424, 25870, 2, 4, 2, 3}, -- Анжинерский чоппер
	{61229, 27913, 1, 3, 2, 3}, -- Бронированный белоснежный грифон
	{61230, 27914, 1, 3, 1, 3}, -- Бронированный синий ветрокрыл
	{61294, 28053, 1, 1, 3, 3}, -- Зеленый протодракон
	{61309, 28060, 1, 4, 3, 3}, -- Великолепный ковер-самолет
	{61425, 27237, 2, 3, 2, 3}, -- Тундровый мамонт путешественника
	{61447, 27238, 2, 3, 1, 3}, -- Тундровый мамонт путешественника
	{61451, 28082, 1, 4, 3, 3}, -- Ковер-самолет
	{61465, 27241, 2, 1, 2, 3}, -- Большой черный боевой мамонт
	{61467, 27240, 2, 1, 1, 3}, -- Большой черный боевой мамонт
	{61469, 27239, 2, 3, 1, 3}, -- Большой ледяной мамонт
	{61470, 27242, 2, 3, 2, 3}, -- Большой ледяной мамонт
	{61996, 27525, 1, 6, 2, 3}, -- Синий дракондор
	{61997, 28402, 1, 6, 1, 3}, -- Красный дракондор
	{63232, 28912, 2, 3, 2, 3}, -- Штормградский скакун
	{63635, 29261, 2, 3, 1, 3}, -- Ящер племени Черного Копья
	{63636, 29258, 2, 3, 2, 3}, -- Стальгорнский баран
	{63637, 29256, 2, 3, 2, 3}, -- Дарнасский ночной саблезуб
	{63638, 28571, 2, 3, 2, 3}, -- Гномреганский механодолгоног
	{63639, 29255, 2, 3, 2, 3}, -- Экзодарский элекк
	{63640, 29260, 2, 3, 1, 3}, -- Оргриммарский волк
	{63641, 29259, 2, 3, 1, 3}, -- Кодо из Громового Утеса
	{63642, 29262, 2, 3, 1, 3}, -- Крылобег из Луносвета
	{63643, 29257, 2, 3, 1, 3}, -- Боевой конь Отрекшихся
	{63796, 28890, 1, 1, 3, 3}, -- Голова Мимирона
	{63844, 22471, 1, 3, 3, 3}, -- Гиппогриф Серебряного Авангарда
	{63956, 28953, 1, 6, 3, 3}, -- Протодракон в железной броне
	{63963, 28954, 1, 6, 3, 3}, -- Ржавый протодракон
	{64656, 10718, 2, 3, 3, 3}, -- Синий боевой конь-скелет
	{64657, 12241, 2, 3, 1, 3}, -- Белый кодо
	{64658, 207, 2, 3, 1, 3}, -- Черный волк
	{64659, 29102, 2, 2, 1, 3}, -- Ядошкурый равазавр
	{64731, 29161, 3, 4, 3, 3}, -- Морская черепаха
	{64927, 25511, 1, 3, 3, 3}, -- Ледяной змей смертоносного гладиатора
	{64977, 29130, 2, 3, 1, 3}, -- Черный конь-скелет
	{65439, 25593, 1, 3, 3, 3}, -- Ледяной змей гневного гладиатора
	{65637, 28606, 2, 3, 2, 3}, -- Большой красный элекк
	{65638, 14333, 2, 3, 2, 3}, -- Стремительный лунопард
	{65639, 28607, 2, 3, 1, 3}, -- Стремительный красный крылобег
	{65640, 29043, 2, 3, 2, 3}, -- Стремительный мышастый конь
	{65641, 28556, 2, 3, 1, 3}, -- Большой золотистый кодо
	{65642, 14375, 2, 3, 2, 3}, -- Турбодолгоног
	{65643, 28612, 2, 3, 2, 3}, -- Стремительный лиловый баран
	{65644, 14343, 2, 3, 1, 3}, -- Стремительный лиловый ящер
	{65645, 28605, 2, 3, 1, 3}, -- Белый боевой конь-скелет
	{65646, 14335, 2, 3, 1, 3}, -- Стремительный пурпурный волк
	{65917, 29344, 2, 9, 3, 3}, -- Волшебный петух
	{66087, 22474, 1, 3, 2, 3}, -- Гиппогриф Серебряного Союза
	{66088, 29696, 1, 3, 1, 3}, -- Дракондор Похитителей Солнца
	{66090, 28888, 2, 3, 2, 3}, -- Кель'дорайский скакун
	{66091, 28889, 2, 3, 1, 3}, -- Крылобег Похитителей Солнца
	{66122, 29344, 2, 9, 3, 3}, -- Волшебный петух
	{66123, 29378, 2, 9, 3, 3}, -- Волшебный петух
	{66124, 29379, 2, 9, 3, 3}, -- Волшебный петух
	{66846, 29754, 2, 3, 1, 3}, -- Коричневый боевой конь-скелет
	{66847, 29755, 2, 3, 2, 3}, -- Полосатый рассветный саблезуб
	{66906, 28919, 2, 3, 3, 3}, -- Скакун Серебряного Авангарда
	{67336, 29794, 1, 6, 3, 3}, -- Ледяной змей неумолимого гладиатора
	{67466, 28918, 2, 3, 3, 3}, -- Боевой конь Серебряного Авангарда
	{68056, 29283, 2, 3, 1, 3}, -- Стремительный ордынский волк
	{68057, 29284, 2, 3, 2, 3}, -- Стремительный скакун Альянса
	{68187, 29937, 2, 6, 2, 3}, -- Белый боевой конь крестоносца
	{68188, 29938, 2, 6, 1, 3}, -- Вороной боевой конь крестоносца
	{69395, 30346, 1, 1, 3, 3}, -- Дракон Ониксии
	{71342, 30989, 1, 1, 3, 3}, -- "Сердцеед" X-45
	{71810, 31047, 1, 6, 3, 3}, -- Ледяной змей разгневанного гладиатора
	{72286, 31007, 1, 1, 3, 3}, -- Непобедимый
	{72807, 31154, 1, 6, 3, 3}, -- Неуклонный ледяной покоритель
	{72808, 31156, 1, 6, 3, 3}, -- Обагренный ледяной покоритель
	{73313, 25279, 2, 2, 3, 3}, -- Багровый конь смерти
	{74856, 31803, 1, 9, 3, 3}, -- Пламенеющий гиппогриф
	{74918, 31721, 2, 9, 3, 3}, -- Белый шерстистый носорог
	{75596, 28063, 1, 4, 3, 3}, -- Заиндевевший ковер-самолет
	{75614, 31958, 1, 10, 3, 3}, -- Небесный скакун
	{75973, 31992, 1, 8, 3, 3}, -- Прогулочная ракета X-53
	{348459, 100566, 2, 8, 3, 2}, -- Пробудившийся внепространственный охотник
	{372677, 106974, 1, 8, 3, 3}, -- Калуакский китовый глайдер
	{387308, 29344, 2, 9, 3, 3}, -- Волшебный петух
	{387311, 23647, 1, 9, 3, 3}, -- ИКС-ключительная ракета Пустоты X-51
	{387319, 25335, 2, 9, 3, 3}, -- Большой боевой медведь
	{387320, 31803, 1, 9, 3, 3}, -- Пламенеющий гиппогриф
	{387321, 31721, 2, 9, 3, 3}, -- Белый шерстистый носорог
	{387323, 23656, 1, 9, 3, 3}, -- Ракета Пустоты X-51
	{394209, 110171, 1, 8, 3, 3}, -- Гниющий изумрудный дракон
}


local mountBySpellID = {}
for i = 1, #mounts.mountsDB do
	local info = mounts.mountsDB[i]
	mountBySpellID[info[1]] = info
end


function MountsJournalUtil.getMountInfoBySpellID(spellID)
	local info = mountBySpellID[spellID]
	if not info then return end
	-- spellID, creatureID, mountType, sourceType, mountFaction, expansion
	return info[5], info[2], info[3], info[4], info[6]
end


function MountsJournalUtil.addNewMount(spellID, creatureID)
	local info = {spellID, creatureID, 1, 0, 3, 3}
	mounts.mountsDB[#mounts.mountsDB + 1] = info
	mountBySpellID[spellID] = info

	if MountsJournalFrame and not MountsJournalFrame.init then
		MountsJournalFrame:sortMounts()
	end
end