local addon, ns = ...
local L = ns.L


ns.journal:on("MODULES_INIT", function(journal)
	local dd = LibStub("LibSFDropDown-1.5"):CreateStretchButtonOriginal(journal.mapSettings, nil, 24)
	dd:SetPoint("TOPLEFT", journal.mapSettings.mapControl, "TOPLEFT", 3, -3)
	dd:SetPoint("RIGHT", journal.mapSettings.CurrentMap, "LEFT", 2, 0)
	dd:SetText(L["Dungeons and Raids"])
	dd.navBar = journal.navBar
	journal.mapSettings.dnr = dd

	local list = {
		{
			name = DUNGEONS,
			list = {
				{
					name = "World of Warcraft",
					list = {242,226,240,219,310,300,301,280,291,221,252,213,279,317,225,230,220},
				},
				{
					name = "The Burning Crusade",
					list = {269,257,347,266,272,261,267,262,263,246,258,274,260,265,273},
				},
				{
					name = "Wrath of the Lich King",
					list = {159,168,132,136,154,185,171,160,133,183,129,143,131,140,138,184},
				},
				{
					name = "Cataclysm",
					list = {325,399,293,277,333,337,398,324,404,310,291,283,323,297},
				},
			},
		},
		{
			name = RAIDS,
			list = {
				{
					name = "World of Warcraft",
					list = {232,287,247,320},
				},
				{
					name = "The Burning Crusade",
					list = {350,330,331,332,334,329,335},
				},
				{
					name = "Wrath of the Lich King",
					list = {156,163,155,141,147,172,248,186,200},
				},
				{
					name = "Cataclysm",
					list = {282,294,285,328,367,409},
				},
			},
		},
	}

	dd:ddSetDisplayMode(addon)
	dd:ddSetValue(list)
	dd:ddSetInitFunc(function(self, level, value)
		local info = {}

		info.isNotRadio = true
		info.notCheckable = true

		for _, v in ipairs(value) do
			if type(v) == "table" then
				info.text = v.name
				info.keepShownOnClick = true
				info.hasArrow = true
				info.value = v.list
			else
				if C_Map.GetMapInfo(v) then
					info.text = C_Map.GetMapInfo(v).name
					info.func = function()
						self.navBar:setMapID(v)
					end
				else
					fprint(v)
				end
			end
			self:ddAddButton(info, level)
		end
	end)
end)