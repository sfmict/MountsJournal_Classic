local addon, ns = ...
local L, util = ns.L, ns.util


ns.journal:on("MODULES_INIT", function(journal)
	local dd = LibStub("LibSFDropDown-1.5"):CreateStretchButtonOriginal(journal.mapSettings, nil, 24)
	dd:SetPoint("TOPLEFT", journal.mapSettings.mapControl, "TOPLEFT", 3, -3)
	dd:SetPoint("RIGHT", journal.mapSettings.CurrentMap, "LEFT", 2, 0)
	dd:SetText(L["Dungeons and Raids"])
	dd.navBar = journal.navBar
	journal.mapSettings.dnr = dd

	local drIconInfo = {
		tCoordLeft = .2,
		tCoordRight = .8,
		tCoordTop = .2,
		tCoordBottom = .8,
	}
	local expIconInfo = {
		tSizeX = 40,
		tSizeY = 20,
	}
	local list = {
		{
			iconInfo = drIconInfo,
			icon = 1488824,
			name = DUNGEONS,
			list = {
				{
					iconInfo = expIconInfo,
					icon = 901157,
					list = {
						{mapID = 437, icon = 632357},
						{mapID = 453, icon = 632359},
						{mapID = 431, icon = 643268},
						{mapID = 435, icon = 136354},
						{mapID = 443, icon = 632361},
						{mapID = 476, icon = 136355},
						{mapID = 458, icon = 643269},
						{mapID = 440, icon = 632362},
						{mapID = 429, icon = 632363},
					},
				},
				{
					iconInfo = expIconInfo,
					icon = 536055,
					list = {
						{mapID = 325, icon = 460873},
						{mapID = 399, icon = 575264},
						{mapID = 293, icon = 460863},
						{mapID = 277, icon = 460866},
						{mapID = 333, icon = 136367},
						{mapID = 337, icon = 136369},
						{mapID = 398, icon = 575266},
						{mapID = 324, icon = 460872},
						{mapID = 404, icon = 575262},
						{mapID = 310, icon = 136357},
						{mapID = 291, icon = 136332},
						{mapID = 283, icon = 460859},
						{mapID = 323, icon = 460875},
						{mapID = 297, icon = 460865},
					},
				},
				{
					iconInfo = expIconInfo,
					icon = 607688,
					list = {
						{mapID = 159, icon = 237593},
						{mapID = 168, icon = 237604},
						{mapID = 132, icon = 237592},
						{mapID = 136, icon = 237606},
						{mapID = 154, icon = 237596},
						{mapID = 185, icon = 336389},
						{mapID = 171, icon = 311220},
						{mapID = 160, icon = 237595},
						{mapID = 133, icon = 237605},
						{mapID = 183, icon = 336392},
						{mapID = 129, icon = 237602},
						{mapID = 143, icon = 237603},
						{mapID = 131, icon = 237601},
						{mapID = 140, icon = 237599},
						{mapID = 138, icon = 237598},
						{mapID = 184, icon = 336391},
					},
				},
				{
					iconInfo = expIconInfo,
					icon = 1378987,
					list = {
						{mapID = 269, icon = 136362},
						{mapID = 257, icon = 136323},
						{mapID = 347, icon = 136338},
						{mapID = 266, icon = 136362},
						{mapID = 272, icon = 136323},
						{mapID = 261, icon = 136338},
						{mapID = 267, icon = 136362},
						{mapID = 262, icon = 136331},
						{mapID = 263, icon = 136331},
						{mapID = 246, icon = 136338},
						{mapID = 258, icon = 136323},
						{mapID = 274, icon = 136330},
						{mapID = 260, icon = 136323},
						{mapID = 349, icon = 136344},
						{mapID = 265, icon = 136331},
						{mapID = 273, icon = 136330},
					},
				},
				{
					iconInfo = expIconInfo,
					icon = 1385726,
					list = {
						{mapID = 242, icon = 136326},
						{mapID = 226, icon = 136336},
						{mapID = 239, icon = 136333},
						{mapID = 235, icon = 136333},
						{mapID = 236, icon = 136333},
						{mapID = 431, icon = 643268},
						{mapID = 219, icon = 136368},
						{mapID = 310, icon = 136357},
						{mapID = 300, icon = 136352},
						{mapID = 301, icon = 136353},
						{mapID = 280, icon = 136345},
						{mapID = 291, icon = 136332},
						{mapID = 435, icon = 136354},
						{mapID = 476, icon = 136355},
						{mapID = 221, icon = 136325},
						{mapID = 252, icon = 136327},
						{mapID = 213, icon = 136350},
						{mapID = 279, icon = 136364},
						{mapID = 317, icon = 136359},
						{mapID = 318, icon = 136359},
						{mapID = 225, icon = 136358},
						{mapID = 230, icon = 136363},
						{mapID = 220, icon = 136360},
					},
				},
			},
		},
		{
			iconInfo = drIconInfo,
			icon = 1488825,
			name = RAIDS,
			["list"] = {
				{
					iconInfo = expIconInfo,
					icon = 901157,
					list = {
						{mapID = 471, icon = 632360},
						{mapID = 474, icon = 632358},
						{mapID = 456, icon = 643270},
						{mapID = 508, icon = 838785},
						{mapID = 557, icon = 904241},
					},
				},
				{
					iconInfo = expIconInfo,
					icon = 536055,
					list = {
						{mapID = 282, icon = 464826},
						{mapID = 294, icon = 460863},
						{mapID = 285, icon = 460860},
						{mapID = 328, icon = 460874},
						{mapID = 367, icon = 529270},
						{mapID = 409, icon = 575261},
					},
				},
				{
					iconInfo = expIconInfo,
					icon = 607688,
					list = {
						{mapID = 156, icon = 303841},
						{mapID = 163, icon = 136347},
						{mapID = 155, icon = 237594},
						{mapID = 141, icon = 237600},
						{mapID = 147, icon = 304502},
						{mapID = 172, icon = 311221},
						{mapID = 248, icon = 329121},
						{mapID = 186, icon = 336390},
						{mapID = 200, icon = 366689},
					},
				},
				{
					iconInfo = expIconInfo,
					icon = 1378987,
					list = {
						{mapID = 350, icon = 136343},
						{mapID = 330, icon = 136337},
						{mapID = 331, icon = 136340},
						{mapID = 332, icon = 136356},
						{mapID = 334, icon = 136362},
						{mapID = 329, icon = 136330},
						{mapID = 340, icon = 136328},
						{mapID = 335, icon = 136361},
					},
				},
				{
					iconInfo = expIconInfo,
					icon = 1385726,
					list = {
						{mapID = 232, icon = 136346},
						{mapID = 287, icon = 136329},
						{mapID = 247, icon = 136320},
						{mapID = 320, icon = 136321},
						--{mapID = 2363, icon = 136326},
					},
				},
			},
		},
	},

	dd:ddSetDisplayMode(addon)
	dd:ddSetValue(list)
	dd:ddSetInitFunc(function(self, level, value)
		local info = {}

		info.isNotRadio = true
		info.notCheckable = true

		local len = #value + 1
		for i, v in ipairs(value) do
			info.icon = v.icon
			info.iconInfo = v.iconInfo
			if v.list then
				info.keepShownOnClick = true
				info.hasArrow = true
				info.text = v.name or ("|cff%s%s|r"):format(util.expColors[len - i], EJ_GetTierInfo(len - i))
				info.value = v.list
			else
				local mapInfo = C_Map.GetMapInfo(v.mapID)
				info.text = mapInfo and mapInfo.name
				info.func = function()
					self.navBar:setMapID(v.mapID)
				end
			end
			self:ddAddButton(info, level)
		end
	end)
end)