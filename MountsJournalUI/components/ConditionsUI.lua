local _, ns = ...
local L, conds, util, macroFrame = ns.L, ns.conditions, ns.util, ns.macroFrame
local getNameByGUID, createRadioInfo, createCheckableInfo, createArrowInfo, createEmptyInfo = util.getNameByGUID, util.createRadioInfo, util.createCheckableInfo, util.createArrowInfo, util.createEmptyInfo
local strcmputf8i, type, concat = strcmputf8i, type, table.concat
local playerGuid = UnitGUID("player")
local ltl = LibStub("LibThingsLoad-1.0")
local sID = "|cff808080%s|r"
local sName_ID = "%s |cff808080<%s>|r"
local sIcon_Name_ID = "%s%s |cff808080<%s>|r"
local sGrayName = "|cffaaaaaa%s|r"
local sGrayName_ID = "|cffaaaaaa%s|r |cff808080<%s>|r"
ns.RULE_ICON_SIZE = 14


---------------------------------------------------
-- mod MODIFIER
conds.mod.text = L["Modifier"]

function conds.mod:getModText(value)
	if value == "any" then
		return L["ANY_MODIFIER"]
	else
		return _G[value:upper().."_KEY_TEXT"]
	end
end

function conds.mod:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		names[i] = self:getModText(value)
	end
	return concat(names, "; ")
end

function conds.mod.sort(values)
	local mods = {
		any = 1,
		alt = 2,
		ctrl = 3,
		shift = 4,
		lalt = 5,
		ralt = 6,
		lctrl = 7,
		rctrl = 8,
		lshift = 9,
		rshift = 10,
	}
	sort(values, function(a, b) return mods[a] < mods[b] end)
end

function conds.mod:getValueList(values, func)
	local mods = {
		"any",
		"alt",
		"ctrl",
		"shift",
		"lalt",
		"ralt",
		"lctrl",
		"rctrl",
		"lshift",
		"rshift",
	}
	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end
	for i = 1, #mods do
		local v = mods[i]
		list[i] = createCheckableInfo(self:getModText(v), v, func, checked)
	end
	return list
end


---------------------------------------------------
-- btn MOUSE BUTTON
conds.btn.text = L["Mouse button"]
conds.btn.onlyOne = true
conds.btn.sort = sort

function conds.btn:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		names[i] = _G["KEY_BUTTON"..value]
	end
	return concat(names, "; ")
end

function conds.btn:getValueList(values, func)
	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	local i = 1
	local text = _G["KEY_BUTTON"..i]
	while text do
		list[i] = createCheckableInfo(text, i, func, checked)
		i = i + 1
		text = _G["KEY_BUTTON"..i]
	end

	return list
end


---------------------------------------------------
-- mcond MACRO CONDITIONS
conds.mcond.text = L["Macro condition"]

function conds.mcond:getValueDescription()
	return [[|cffffffffexists
help
dead
party, raid
unithasvehicleui
canexitvehicle
channeling, channeling:spellName
equipped:type, worn:type
flyable
flying
form:n, stance:n
group, group:party, group:raid
indoors, outdoors
known:name, known:spellID
mounted
pet:name, pet:family
petbattle
pvpcombat
resting
spec:n, spec:n1/n2
stealth
swimming
actionbar:n, bar:n, bar:n1/n2/...
bonusbar, bonusbar:n
button:n, btn:n1/n2/...
cursor
extrabar
modifier, mod, mod:key, mod:action
overridebar
possessbar
shapeshift
vehicleui|r

[mod:shift,swimming][btn:2]
]]
end

function conds.mcond:getValueText(value)
	return value
end


---------------------------------------------------
-- class
conds.class.text = CLASS
conds.class.onlyOne = true
conds.class.sort = sort

function conds.class:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		local localized, className = GetClassInfo(value)
		if localized then
			local classColor = RAID_CLASS_COLORS[className]
			local t = CLASS_ICON_TCOORDS[className]
			local size = 1024
			names[#names + 1] = CreateTextureMarkup("Interface/Glues/CharacterCreate/UI-CharacterCreate-Classes", size, size, ns.RULE_ICON_SIZE, ns.RULE_ICON_SIZE, t[1], t[2], t[3], t[4])..classColor:WrapTextInColorCode(localized)
		end
	end
	return concat(names, "; ")
end

function conds.class:getValueList(values, func)
	local list = {}
	local checked = function(btn) return tContains(values,btn.value) end

	for i = 1, GetNumClasses() do
		local localized, className, id = GetClassInfo(i)
		local classColor = RAID_CLASS_COLORS[className]
		local t = CLASS_ICON_TCOORDS[className]
		list[i] = createCheckableInfo(
			classColor:WrapTextInColorCode(localized), id, func, checked, nil,
			"Interface/Glues/CharacterCreate/UI-CharacterCreate-Classes",
			{
				tCoordLeft = t[1],
				tCoordRight = t[2],
				tCoordTop = t[3],
				tCoordBottom = t[4],
			}
		)
	end

	return list
end


---------------------------------------------------
-- spec
conds.spec.text = SPECIALIZATION
conds.spec.onlyOne = true

function conds.spec:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		local _, name, _, specIcon, _, className, class = GetSpecializationInfoByID(value)
		if name then
			local classColor = RAID_CLASS_COLORS[className]
			local icon = CreateSimpleTextureMarkup(specIcon, ns.RULE_ICON_SIZE)
			names[#names + 1] = ("%s%s - %s"):format(icon, classColor:WrapTextInColorCode(class), name)
		end
	end
	return concat(names, "; ")
end

function conds.spec.sort(values)
	local list, n = {}, 1
	for i = 1, GetNumClasses() do
		for j = 1, C_SpecializationInfo.GetNumSpecializationsForClassID(i) do
			local id = GetSpecializationInfoForClassID(i, j)
			list[id] = n
			n = n + 1
		end
	end
	sort(values, function(a, b) return list[a] < list[b] end)
end

function conds.spec:getValueList(values, func)
	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	for i = 1, GetNumClasses() do
		for j = 1, C_SpecializationInfo.GetNumSpecializationsForClassID(i) do
			local id = GetSpecializationInfoForClassID(i, j)
			local _, name, _, specIcon, _, className, class = GetSpecializationInfoByID(id)
			local classColor = RAID_CLASS_COLORS[className]
			local text = ("%s - %s"):format(classColor:WrapTextInColorCode(class), name)
			list[#list + 1] = createCheckableInfo(text, id, func, checked, nil, specIcon)
		end
	end

	return list
end


---------------------------------------------------
-- zt ZONE TYPE
conds.zt.text = L["Zone type"]
conds.zt.onlyOne = true

local function getZoneTypeName(value)
	if value == "scenario" then
		return TRACKER_HEADER_SCENARIO
	elseif value == "party" then
		return TRACKER_HEADER_DUNGEON
	elseif value == "raid" then
		return RAID
	elseif value == "arena" then
		return ARENA
	elseif value == "pvp" then
		return BATTLEGROUND
	end
	return value
end

function conds.zt:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		names[i] = getZoneTypeName(value)
	end
	return concat(names, "; ")
end

function conds.zt.sort(values)
	sort(values, function(a, b) return strcmputf8i(getZoneTypeName(a), getZoneTypeName(b)) < 0 end)
end

function conds.zt:getValueList(values, func)
	local zoneTypes = {
		"scenario",
		"party",
		"raid",
		"arena",
		"pvp"
	}
	self.sort(zoneTypes)

	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	for i = 1, #zoneTypes do
		local v = zoneTypes[i]
		list[i] = createCheckableInfo(getZoneTypeName(v), v, func, checked)
	end

	return list
end


---------------------------------------------------
-- holiday
conds.holiday.text = CALENDAR_FILTER_WEEKLY_HOLIDAYS

function conds.holiday:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		local holidayName = ns.calendar:getHolidayName(value)
		names[i] = sName_ID:format(holidayName or RED_FONT_COLOR:WrapTextInColorCode(L["Nameless holiday"]), value)
	end
	return concat(names, "; ")
end

function conds.holiday.sort(values)
	sort(values, function(a, b)
		if a == b then return false end

		local aName = ns.calendar:getHolidayName(a) or L["Nameless holiday"]
		local bName = ns.calendar:getHolidayName(b) or L["Nameless holiday"]
		if aName ~= bName then return strcmputf8i(aName, bName) < 0 end

		return a < b
	end)
end

function conds.holiday:getValueList(values, cb, dd, notReset)
	local list = {custom = true}
	list[1] = {
		customFrame = ns.journal.bgFrame.calendarFrame,
		OnLoad = function(frame)
			local value = function() return self:getValueList(values, cb, dd, true) end
			frame:init(1, value, dd)
		end
	}
	local subList = {}
	list[2] = {list = subList}

	if not notReset then ns.calendar:setCurrentDate() end
	local eList = ns.calendar:getHolidayList()
	local checked = function(btn) return tContains(values, btn.value) end

	local function notEContains(eventID)
		for i = 1, #eList do
			if eList[i].eventID == eventID then return false end
		end
		return true
	end

	for i, value in ipairs(values) do
		if notEContains(value) then
			local name = ns.calendar:getHolidayName(value)
			local text = name and sGrayName:format(name) or RED_FONT_COLOR:WrapTextInColorCode(L["Nameless holiday"])
			subList[#subList + 1] = createCheckableInfo(text, value, cb, checked, sID:format(value))
		end
	end

	local func = function(btn, arg1, ...)
		ns.calendar:saveHolidayName(btn.value, arg1)
		cb(btn, arg1, ...)
		dd:ddRefresh()
	end

	local OnTooltipShow = function(btn, tooltip, _, description)
		tooltip:AddLine(description, nil, nil, nil, true)
		tooltip:AddDoubleLine("ID", btn.value, 1,1,1,1,1,1)
	end

	for i = 1, #eList do
		local e = eList[i]
		local startDate = FormatShortDate(e.st.monthDay, e.st.month)
		local endDate = FormatShortDate(e.et.monthDay, e.et.month)
		local text = e.isActive and ("%s (|cff00cc00%s|r)"):format(e.name, L["HOLIDAY_ACTIVE"]) or e.name
		local rightText = ("|cff80b5fd%s - %s|r"):format(startDate, endDate)
		local info = createCheckableInfo(text, e.eventID, func, checked, rightText, e.icon, e.iconInfo)
		info.arg1 = e.name
		info.arg2 = e.description
		info.OnTooltipShow = OnTooltipShow
		subList[#subList + 1] = info
	end

	return list
end


---------------------------------------------------
-- falling
conds.falling.text = L["The player is falling"]
conds.falling.onlyOne = true


---------------------------------------------------
-- moving
conds.moving.text = L["The player is moving"]
conds.moving.onlyOne = true


---------------------------------------------------
-- indoors
conds.indoors.text = L["The player is indoors"]
conds.indoors.onlyOne = true


---------------------------------------------------
-- swimming
conds.swimming.text = L["The player is swimming"]
conds.swimming.onlyOne = true


---------------------------------------------------
-- mounted
conds.mounted.text = L["The player is mounted"]
conds.mounted.onlyOne = true


---------------------------------------------------
-- vehicle
conds.vehicle.text = L["The player is within an vehicle"]
conds.vehicle.onlyOne = true


---------------------------------------------------
-- flyable
conds.flyable.text = L["Flyable area"]
conds.flyable.onlyOne = true


---------------------------------------------------
-- dead
conds.dead.text = L["The player is dead"]
conds.dead.onlyOne = true


---------------------------------------------------
-- rest
conds.rest.text = L["The player is resting"]
conds.rest.onlyOne = true


---------------------------------------------------
-- combat
conds.combat.text = L["The player is in combat"]
conds.combat.onlyOne = true


---------------------------------------------------
-- lvlm LEVEL MORE
conds.lvlm.text = LEVEL.." "..L["> (more than)"]
conds.lvlm.isNumeric = true
conds.lvlm.onlyOne = true

conds.lvlm.getValueText = conds.mcond.getValueText


---------------------------------------------------
-- lvll LEVEL LESS
conds.lvll.text = LEVEL.." "..L["< (less than)"]
conds.lvll.isNumeric = true
conds.lvll.onlyOne = true

conds.lvll.getValueText = conds.mcond.getValueText


---------------------------------------------------
-- lvleq LEVEL EQUAL
conds.lvleq.text = LEVEL.." "..L["= (equal to)"]
conds.lvleq.isNumeric = true
conds.lvleq.onlyOne = true

conds.lvleq.getValueText = conds.mcond.getValueText


---------------------------------------------------
-- hitem HAVE ITEM
conds.hitem.text = L["Have item"]
conds.hitem.isNumeric = true

function conds.hitem:getValueDescription()
	return "ItemID"
end

local function getItemID(value)
	local itemID = tonumber(value)
	if not itemID and value then
		itemID = tonumber(value:match("item:(%d*)"))
		if not itemID then
			local link = ltl:GetItemLink(value)
			if link then
				itemID = tonumber(link:match("item:(%d*)"))
			end
		end
	end
	return itemID
end

function conds.hitem:setValueLink(fontString, value)
	fontString:SetText()
	if not value then return end
	local itemID = value
	if type(value) == "string" then itemID = getItemID(value) end
	if not itemID then return end
	fontString.value = value
	ltl:Items(itemID):Then(function()
		if fontString.value == value then
			local _, itemLink, _,_,_,_,_,_,_, icon = ltl:GetItemInfo(value)
			fontString:SetText(util.getIconLink(itemLink, icon))
		end
	end)
end

function conds.hitem:receiveDrag(editBox)
	local infoType, itemID = GetCursorInfo()
	if infoType == "item" then
		editBox:SetText(itemID)
		editBox:SetCursorPosition(0)
		editBox:HighlightText()
		ClearCursor()
	end
end

function conds.hitem:getValueDisplay(value, noIcon)
	local name = ltl:GetItemName(value)
	if name then
		local icon = noIcon and "" or CreateSimpleTextureMarkup(ltl:GetItemIcon(value) or util.noIcon, ns.RULE_ICON_SIZE)
		return sIcon_Name_ID:format(icon, name, value)
	else
		ltl:Items(value):ThenForAll(function()
			macroFrame:event("RULE_LIST_UPDATE")
		end)
	end
end

function conds.hitem:getValueText(value)
	return tostring(value or "")
end


---------------------------------------------------
-- ritem READY ITEM
conds.ritem.text = L["Item is ready"]
conds.ritem.isNumeric = true

conds.ritem.getValueDescription = conds.hitem.getValueDescription
conds.ritem.setValueLink = conds.hitem.setValueLink
conds.ritem.receiveDrag = conds.hitem.receiveDrag
conds.ritem.getValueDisplay = conds.hitem.getValueDisplay
conds.ritem.getValueText = conds.hitem.getValueText


---------------------------------------------------
-- kspell KNOWN SPELL
conds.kspell.text = L["Spell is known"]
conds.kspell.isNumeric = true

function conds.kspell:getValueDescription()
	return "SpellID"
end

function conds.kspell:setValueLink(fontString, value)
	if value then
		local link = ltl:GetSpellLink(value)
		local icon = link and link ~= "" and ltl:GetSpellInfo(value).iconID
		fontString:SetText(util.getIconLink(link, icon))
	else
		fontString:SetText()
	end
end

function conds.kspell:receiveDrag(editBox)
	local infoType, itemID, _, spellID = GetCursorInfo()
	if infoType == "item" then
		spellID = select(2, C_Item.GetItemSpell(itemID))
	elseif infoType == "petaction" then
		spellID = itemID
	elseif infoType ~= "spell" then
		return
	end
	if spellID then
		editBox:SetText(spellID)
		editBox:SetCursorPosition(0)
		editBox:HighlightText()
		ClearCursor()
	end
end

function conds.kspell:getValueDisplay(value, noIcon)
	local info = ltl:GetSpellInfo(value)
	if info then
		local icon = noIcon and "" or CreateSimpleTextureMarkup(info.iconID or util.noIcon, ns.RULE_ICON_SIZE)
		return sIcon_Name_ID:format(icon, info.name, value)
	end
end

conds.kspell.getValueText = conds.hitem.getValueText


---------------------------------------------------
-- rspell READY SPELL
conds.rspell.text = L["Spell is ready"]
conds.rspell.isNumeric = true

function conds.rspell:getValueDescription()
	return "SpellID (61304 for GCD)"
end

conds.rspell.setValueLink = conds.kspell.setValueLink
conds.rspell.receiveDrag = conds.kspell.receiveDrag
conds.rspell.getValueDisplay = conds.kspell.getValueDisplay
conds.rspell.getValueText = conds.hitem.getValueText


---------------------------------------------------
-- uspell USABLE SPELL
conds.uspell.text = L["Spell is usable"]
conds.uspell.isNumeric = true

conds.uspell.getValueDescription = conds.kspell.getValueDescription
conds.uspell.setValueLink = conds.kspell.setValueLink
conds.uspell.receiveDrag = conds.kspell.receiveDrag
conds.uspell.getValueDisplay = conds.kspell.getValueDisplay
conds.uspell.getValueText = conds.hitem.getValueText


---------------------------------------------------
-- hbuff HAS BUFF
conds.hbuff.text = L["The player has a buff"]
conds.hbuff.isNumeric = true

conds.hbuff.getValueDescription = conds.kspell.getValueDescription
conds.hbuff.setValueLink = conds.kspell.setValueLink
conds.hbuff.receiveDrag = conds.kspell.receiveDrag
conds.hbuff.getValueDisplay = conds.kspell.getValueDisplay
conds.hbuff.getValueText = conds.hitem.getValueText


---------------------------------------------------
-- hdebuff HAS DEBUFF
conds.hdebuff.text = L["The player has a debuff"]
conds.hdebuff.isNumeric = true

conds.hdebuff.getValueDescription = conds.kspell.getValueDescription
conds.hdebuff.setValueLink = conds.kspell.setValueLink
conds.hdebuff.receiveDrag = conds.kspell.receiveDrag
conds.hdebuff.getValueDisplay = conds.kspell.getValueDisplay
conds.hdebuff.getValueText = conds.hitem.getValueText


---------------------------------------------------
-- qc QUEST COMPLETED
conds.qc.text = QUEST_COMPLETE
conds.qc.isNumeric = true

function conds.qc:getValueDescription()
	return "questID"
end

conds.qc.getValueText = conds.hitem.getValueText


---------------------------------------------------
-- faction
conds.faction.text = FACTION
conds.faction.onlyOne = true

function conds.faction:getValueText(value)
	return FACTION_LABELS[value]
end

function conds.faction:getValueList(value, func)
	local list = {}
	for i = 0, #PLAYER_FACTION_GROUP do
		list[#list + 1] = createRadioInfo(self:getValueText(i), i, func, i == value)
	end
	return list
end


---------------------------------------------------
-- race
conds.race.text = RACE
conds.race.onlyOne = true

local RACE_KEYS = {
	1, -- Human
	2, -- Orc
	3, -- Dwarf
	4, -- NightElf
	5, -- Scourge
	6, -- Tauren
	7, -- Gnome
	8, -- Troll
	9, -- Goblin
	10, -- BloodElf
	11, -- Draenei
	22, -- Worgen
	24, -- Pandaren
}
local RACE_LABELS = {}
for i = 1, #RACE_KEYS do
	local id = RACE_KEYS[i]
	local info = C_CreatureInfo.GetRaceInfo(id)
	RACE_KEYS[i] = info.clientFileString
	RACE_LABELS[info.clientFileString] = info.raceName
end

function conds.race:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		local atlasName = util.getRaceAtlas(value, UnitSex("Player"))
		names[i] = CreateAtlasMarkup(atlasName, ns.RULE_ICON_SIZE, ns.RULE_ICON_SIZE)..RACE_LABELS[value]
	end
	return concat(names, "; ")
end

function conds.race.sort(values)
	sort(values, function(a,b) return strcmputf8i(RACE_LABELS[a], RACE_LABELS[b]) < 0 end)
end

function conds.race:getValueList(values, func)
	local sex = UnitSex("Player")
	self.sort(RACE_KEYS)

	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	for i = 1, #RACE_KEYS do
		local v = RACE_KEYS[i]
		list[#list + 1] = createCheckableInfo(RACE_LABELS[v], v, func, checked, nil, util.getRaceAtlas(v, sex))
	end

	return list
end


---------------------------------------------------
-- zone
conds.zone.text = ZONE

function conds.zone:getValueDescription()
	return L["Zone Name/Subzone Name"]
end

conds.zone.getValueText = conds.mcond.getValueText


---------------------------------------------------
-- map
conds.map.text = L["Map"]
conds.map.onlyOne = true

local function getMapName(value)
	if value == ns.mounts.defMountsListID then
		return WORLD
	else
		local mapInfo = util.getMapFullNameInfo(value)
		if mapInfo then return mapInfo.name end
	end
	return RED_FONT_COLOR:WrapTextInColorCode(value)
end

function conds.map:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		names[i] = getMapName(value)
	end
	return concat(names, "; ")
end

function conds.map.sort(values)
	sort(values, function(a, b)
		if a == b then return false end
		return strcmputf8i(getMapName(a), getMapName(b)) < 0
	end)
end

function conds.map:getValueList(values, func)
	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	for i, value in ipairs(values) do
		list[i] = createCheckableInfo(getMapName(value), value, func, checked)
	end

	if #list == 0 then
		list[1] = createEmptyInfo()
	end

	return list
end


---------------------------------------------------
-- mapf MAP FLAGS
conds.mapf.text = L["Map flags"]

function conds.mapf:getValueText(value)
	local flag, profile = (":"):split(value, 2)

	local flags = {
		groundOnly = L["Ground Mounts Only"],
		waterWalkOnly = L["Water Walking"],
		herbGathering = L["Herb Gathering"],
	}

	if profile == "" then
		profile = DEFAULT
	elseif not ns.mounts.profiles[profile] then
		profile = RED_FONT_COLOR:WrapTextInColorCode(profile)
	end

	return ("%s - %s"):format(profile, flags[flag])
end

function conds.mapf:getValueList(value, func)
	local list = {}

	local flags = {
		groundOnly = L["Ground Mounts Only"],
		waterWalkOnly = L["Water Walking"],
		herbGathering = L["Herb Gathering"],
	}

	local profiles = {}
	for k in next, ns.mounts.profiles do profiles[#profiles + 1] = k end
	sort(profiles, function(a, b) return strcmputf8i(a, b) < 0 end)
	tinsert(profiles, 1, DEFAULT)

	list[1] = {
		notCheckable = true,
		isTitle = true,
		text = L["Profiles"],
	}

	for i = 1, #profiles do
		local profileName = profiles[i]
		local flagList = {}

		for k, name in next, flags do
			local v = ("%s:%s"):format(k, profileName == DEFAULT and "" or profileName)
			flagList[#flagList + 1] = createRadioInfo(name, v, func, v == value)
		end

		list[i + 1] = createArrowInfo(profileName, flagList)
	end

	return list
end


---------------------------------------------------
-- instance
conds.instance.text = INSTANCE
conds.instance.onlyOne = true
conds.instance.sort = sort

function conds.instance:getValueDescription()
	return {
		TAXINODEYOUAREHERE,
		{INSTANCE, ns.mounts.instanceName},
		{"instanceID", ns.mounts.instanceID},
	}
end

function conds.instance:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		names[i] = sName_ID:format(GetRealZoneText(value), value)
	end
	return concat(names, "; ")
end

function conds.instance:getValueList(values, func)
	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	local instanceID = 0
	local skipped = 0
	while skipped < 200 do
		local name = GetRealZoneText(instanceID)

		if name and name ~= "" then
			list[#list + 1] = createCheckableInfo(name, instanceID, func, checked, sID:format(instanceID))
			skipped = 0
		else
			skipped = skipped + 1
		end

		instanceID = instanceID + 1
	end

	sort(list, function(a, b)
		if a == b then return false end

		local checkedA = a:checked()
		local checkedB = b:checked()
		if checkedA and not checkedB then return true
		elseif not checkedA and checkedB then return false end

		return a.value < b.value
	end)

	return list
end


---------------------------------------------------
-- difficulty
conds.difficulty.text = DUNGEON_DIFFICULTY
conds.difficulty.onlyOne = true

local function getDifficultyName(value)
	if value == 0 then return WORLD end
	local name, instanceType, _,_,_,_,_, isLFR, minPlayers, maxPlayers = GetDifficultyInfo(value)
	local separator = " |cff808080|||r "

	if name then
		if instanceType == "raid" then
			name = name..separator..LEGENDARY_ORANGE_COLOR:WrapTextInColorCode(RAID)
		elseif instanceType == "party" then
			name = name..separator..EPIC_PURPLE_COLOR:WrapTextInColorCode(LFG_TYPE_DUNGEON)
		end

		if isLFR then name = name..separator..HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(minPlayers.." - "..maxPlayers) end
		if IsLegacyDifficulty(value) then name = name..separator..ARTIFACT_GOLD_COLOR:WrapTextInColorCode(LFG_LIST_LEGACY) end

		return name
	end
end

function conds.difficulty:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		names[i] = getDifficultyName(value)
	end
	return concat(names, "; ")
end

function conds.difficulty.sort(values)
	sort(values, function(a, b)
		if a == b then return false end

		local aIsLegacy = IsLegacyDifficulty(a)
		local bIsLegacy = IsLegacyDifficulty(b)
		if aIsLegacy and not bIsLegacy then return false
		elseif not aIsLegacy and bIsLegacy then return true end

		local _, aInstanceType, _,_,_,_,_, aIsLFR = GetDifficultyInfo(a)
		local _, bInstanceType, _,_,_,_,_, bIsLFR = GetDifficultyInfo(b)
		if aIsLFR and not bIsLFR then return false
		elseif not aIsLFR and bIsLFR then return true end

		local aIsRaid = aInstanceType == "raid"
		local bIsRaid = bInstanceType == "raid"
		if aIsRaid and not bIsRaid then return false
		elseif not aIsRaid and bIsRaid then return true end

		local aIsPary = aInstanceType == "party"
		local bIsPary = bInstanceType == "party"
		if aIsPary and not bIsPary then return false
		elseif not aIsPary and bIsPary then return true end

		return a < b
	end)
end

function conds.difficulty:getValueList(values, func)
	local ids = {}
	for k, id in next, DifficultyUtil.ID do
		if GetDifficultyInfo(id) then
			ids[#ids + 1] = id
		end
	end
	self.sort(ids)
	tinsert(ids, 1, 0)

	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	for i = 1, #ids do
		local id = ids[i]
		list[i] = createCheckableInfo(getDifficultyName(id), id, func, checked)
	end

	return list
end


---------------------------------------------------
-- tmog TRANSMOG
conds.tmog.text = TRANSMOGRIFY

function conds.tmog:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		local name, guid = ("\n"):split(value, 2)
		if guid == playerGuid or guid == nil then
			names[i] = guid and name or sGrayName:format(name)
		else
			names[i] = sGrayName_ID:format(getNameByGUID(guid), name)
		end
	end
	return concat(names, "; ")
end

function conds.tmog.sort(values)
	sort(values, function(a, b)
		local aName, aGuid = ("\n"):split(a, 2)
		local bName, bGuid = ("\n"):split(b, 2)

		if aGuid ~= bGuid then return strcmputf8i(aGuid or "", bGuid or "") < 0 end
		return strcmputf8i(aName, bName) < 0
	end)
end

function conds.tmog:getValueList(values, func)
	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	for i, value in ipairs(values) do
		local name, guid = ("\n"):split(value, 2)
		if guid ~= playerGuid then
			local text = guid and sGrayName_ID:format(getNameByGUID(guid), name) or sGrayName:format(name)
			list[#list + 1] = createCheckableInfo(text, value, func, checked, nil, util.noIcon)
		end
	end

	for i, id in ipairs(C_TransmogCollection.GetOutfits()) do
		local name, icon = C_TransmogCollection.GetOutfitInfo(id)
		local v = name.."\n"..playerGuid
		list[#list + 1] = createCheckableInfo(name, v, func, checked, nil, icon)
	end

	if #list == 0 then
		list[1] = createEmptyInfo()
	end

	return list
end


---------------------------------------------------
-- sex
conds.sex.text = L["Sex"]

function conds.sex:getValueText(value)
	local unit, sex = (":"):split(value, 2)
	if sex == "2" then
		sex = MALE
	elseif sex == "3" then
		sex = FEMALE
	else
		sex = UNKNOWN
	end
	return ("%s - %s"):format(unit:upper(), sex)
end

function conds.sex:getValueList(value, func)
	local list = {}
	for i, unit in ipairs({"player", "target", "focus"}) do
		for j = 3, 1, -1 do
			local v = ("%s:%s"):format(unit, j)
			list[#list + 1] = createRadioInfo(self:getValueText(v), v, func, v == value)
		end
	end
	return list
end


---------------------------------------------------
-- mtrack MINIMAP TRACKING
conds.mtrack.text = TRACKING

function conds.mtrack:getValueText(value)
	local k, v, name, icon = (":"):split(value, 2)
	v = tonumber(v)
	for i = 1, C_Minimap.GetNumTrackingTypes() do
		local trackingInfo = C_Minimap.GetTrackingInfo(i)
		if trackingInfo[k] == v then
			name = trackingInfo.name
			break
		end
	end
	if not name and k == "spellID" then
		name = C_Spell.GetSpellName(v)
	end
	if name then
		if icon and C_Texture.GetAtlasInfo(icon) then
			icon = CreateAtlasMarkup(icon, ns.RULE_ICON_SIZE, ns.RULE_ICON_SIZE)
		else
			icon = CreateSimpleTextureMarkup(icon or util.noIcon, ns.RULE_ICON_SIZE)
		end
		return sIcon_Name_ID:format(icon, name, value)
	end
	return value
end

function conds.mtrack:getValueList(value, func)
	local list = {}
	local isHunterClass = select(2, UnitClass("player")) == "HUNTER"

	local hunterList = {}
	local townfolkList = {}
	local regularList = {}

	for i = 1, C_Minimap.GetNumTrackingTypes() do
		local trackingInfo = C_Minimap.GetTrackingInfo(i)
		local v = trackingInfo.spellID and "spellID:"..trackingInfo.spellID or "texture:"..trackingInfo.texture

		local info = createRadioInfo(trackingInfo.name, v, func, v == value, sID:format(v), trackingInfo.texture)

		if isHunterClass and trackingInfo.subType == HUNTER_TRACKING then
			hunterList[#hunterList + 1] = info
		elseif trackingInfo.subType == TOWNSFOLK_TRACKING then
			townfolkList[#townfolkList + 1] = info
		else
			regularList[#regularList + 1] = info
		end
	end

	if #hunterList == 1 then
		list[#list + 1] = hunterList[1]
	elseif #hunterList > 1 then
		list[#list + 1] = createArrowInfo(HUNTER_TRACKING_TEXT, hunterList)
	end

	if #townfolkList > 0 then
		list[#list + 1] = createArrowInfo(TOWNSFOLK_TRACKING_TEXT, townfolkList)
	end

	for i = 1, #regularList do
		list[#list + 1] = regularList[i]
	end

	return list
end


---------------------------------------------------
-- prof PROFESSION
conds.prof.text = TRADE_SKILLS

function conds.prof:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		local name = C_TradeSkillUI.GetTradeSkillDisplayName(value) or RED_FONT_COLOR:WrapTextInColorCode(value)
		local icon = CreateSimpleTextureMarkup(C_TradeSkillUI.GetTradeSkillTexture(value) or util.noIcon, ns.RULE_ICON_SIZE)
		names[i] = icon..name
	end
	return concat(names, "; ")
end

function conds.prof.sort(values)
	sort(values, function(a, b)
		if a == b then return false end
		return strcmputf8i(
			C_TradeSkillUI.GetTradeSkillDisplayName(a) or tostring(a),
			C_TradeSkillUI.GetTradeSkillDisplayName(b) or tostring(b)
		) < 0
	end)
end

function conds.prof:getValueList(values, func)
	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	for id in next, WORLD_QUEST_ICONS_BY_PROFESSION do
		local icon = C_TradeSkillUI.GetTradeSkillTexture(id)
		if icon then
			list[#list + 1] = createCheckableInfo(C_TradeSkillUI.GetTradeSkillDisplayName(id), id, func, checked, nil, icon)
		end
	end

	sort(list, function(a, b) return strcmputf8i(a.text, b.text) < 0 end)
	return list
end


---------------------------------------------------
-- equips EQUIPMENT SET
conds.equips.text = PAPERDOLL_EQUIPMENTMANAGER

function conds.equips:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		local setID, guid = (":"):split(value, 2)
		if guid == playerGuid then
			local name = C_EquipmentSet.GetEquipmentSetInfo(tonumber(setID))
			names[i] = name and name or sGrayName_ID:format(getNameByGUID(guid), setID)
		else
			names[i] = sGrayName_ID:format(getNameByGUID(guid), setID)
		end
	end
	return concat(names, ": ")
end

function conds.equips.sort(values)
	sort(values, function(a, b)
		local aSetID, aGuid = (":"):split(a, 2)
		local bSetID, bGuid = (":"):split(b, 2)

		if aGuid ~= bGuid then return strcmputf8i(aGuid, bGuid) < 0 end
		return tonumber(aSetID) < tonumber(bSetID)
	end)
end

function conds.equips:getValueList(values, func)
	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	for i, value in ipairs(values) do
		local setID, guid = (":"):split(value, 2)
		if guid ~= playerGuid or C_EquipmentSet.GetEquipmentSetInfo(tonumber(setID)) == nil then
			local text = sGrayName:format(getNameByGUID(guid))
			list[#list + 1] = createCheckableInfo(text, value, func, checked, sID:format(setID), util.noIcon)
		end
	end

	for i, setID in ipairs(C_EquipmentSet.GetEquipmentSetIDs()) do
		local name, iconFileID = C_EquipmentSet.GetEquipmentSetInfo(setID)
		local v = ("%s:%s"):format(setID, playerGuid)
		list[#list + 1] = createCheckableInfo(name, v, func, checked, sID:format(setID), iconFileID)
	end

	if #list == 0 then
		list[1] = createEmptyInfo()
	end

	return list
end


---------------------------------------------------
-- equipi EQUIPPED ITEM
conds.equipi.text = L["Item is equipped"]

conds.equipi.setValueLink = conds.hitem.setValueLink

function conds.equipi:receiveDrag(editBox)
	local infoType, _, link = GetCursorInfo()
	if infoType == "item" then
		editBox:SetText(link)
		editBox:SetCursorPosition(0)
		editBox:HighlightText()
		ClearCursor()
	end
end

function conds.equipi:getValueDisplay(value)
	local itemID = getItemID(value)
	return itemID and conds.hitem.getValueDisplay(self, itemID)
end

conds.equipi.getValueText = conds.mcond.getValueText


---------------------------------------------------
-- gstate GET STATE
conds.gstate.text = L["Get State"]
conds.gstate.description = L["Get a state that can be set in actions using \"Set State\""]

function conds.gstate:getValueText(value)
	return value
end


---------------------------------------------------
-- snip SNIPPET
conds.snip.text = L["Code Snippet"]

function conds.snip:getValueText(value)
	if macroFrame.snippets[value] then
		return value
	end
	return RED_FONT_COLOR:WrapTextInColorCode(value)
end

function conds.snip:getValueList(value, func)
	local list = {}

	for name in next, macroFrame.snippets do
		list[#list + 1] = createRadioInfo(name, name, func, name == value)
	end

	if #list > 1 then
		sort(list, function(a, b) return strcmputf8i(a.text, b.text) < 0 end)
	elseif #list == 0 then
		list[1] = createEmptyInfo()
	end

	return list
end


---------------------------------------------------
-- group GROUP TYPE
conds.group.text = L["Group Type"]
conds.group.onlyOne = true

function conds.group:getValueText(value)
	if value == "group" then
		return PARTY
	elseif value == "raid" then
		return RAID
	end
	return L["ANY_GROUP"]
end

function conds.group:getValueList(value, func)
	local list = {}
	for i, v in ipairs({"any", "group", "raid"}) do
		list[i] = createRadioInfo(self:getValueText(v), v, func, v == value)
	end
	return list
end


---------------------------------------------------
-- fgroup FRIEND IN PARTY
conds.fgroup.text = L["Friend in Party"]

local function getFriendList(value, func)
	local friends = {}
	local favIcon = CreateAtlasMarkup("PetJournal-FavoritesIcon", 20, 20)
	local noteIcon = CreateSimpleTextureMarkup("Interface/FriendsFrame/UI-FriendsFrame-Note", 12, 12)
	local numBNetTotal, numBNetOnline, numBNetFavorite = BNGetNumFriends()
	local numWoWTotal, numWoWOnline = 0, 0

	if C_GameRules.GetActiveGameMode() == Enum.GameMode.Standard then
		numWoWTotal = C_FriendList.GetNumFriends()
		numWoWOnline = C_FriendList.GetNumOnlineFriends()
	end

	local function onEnter(btn, note)
		if note and note ~= "" then
			GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
			GameTooltip:SetText(noteIcon..note)
			GameTooltip:Show()
		end
	end

	local function addBNet(i)
		local accountInfo = C_BattleNet.GetFriendAccountInfo(i)
		local v, icon = "btag:"..accountInfo.battleTag
		--local nameText, nameColor, statusTexture = FriendsFrame_GetBNetAccountNameAndStatus(accountInfo)
		local nameText = accountInfo.accountName
		if nameText == "" then
			nameText = accountInfo.battleTag:match("(.*)#") or ""
		end
		local text = accountInfo.isFavorite and nameText..favIcon or nameText

		if not accountInfo.gameAccountInfo.isOnline then
			icon = FRIENDS_TEXTURE_OFFLINE
		elseif accountInfo.isGameAFK then
			icon = FRIENDS_TEXTURE_AFK
		elseif accountInfo.isGameBusy then
			icon = FRIENDS_TEXTURE_DND
		else
			icon = FRIENDS_TEXTURE_ONLINE
		end

		local info = createRadioInfo(text, v, func, v == value, nil, icon)
		info.arg1 = accountInfo.note
		info.OnEnter = onEnter
		info.OnLeave = GameTooltip_Hide
		friends[#friends + 1] = info
	end

	local function addWoW(i)
		local friendInfo = C_FriendList.GetFriendInfoByIndex(i)
		local v, icon = "guid:"..friendInfo.guid
		local text = friendInfo.connected and friendInfo.name..", "..FRIENDS_LEVEL_TEMPLATE:format(friendInfo.level, friendInfo.className) or friendInfo.name

		if not friendInfo.connected then
			icon = FRIENDS_TEXTURE_OFFLINE
		elseif friendInfo.afk then
			icon = FRIENDS_TEXTURE_AFK
		elseif friendInfo.dnd then
			icon = FRIENDS_TEXTURE_DND
		else
			icon = FRIENDS_TEXTURE_ONLINE
		end

		local info = createRadioInfo(text, v, func, v == value, nil, icon)
		info.arg1 = friendInfo.notes
		info.OnEnter = onEnter
		info.OnLeave = GameTooltip_Hide
		friends[#friends + 1] = info
	end

	for i = 1, numBNetFavorite + numBNetOnline do addBNet(i) end
	for i = 1, numWoWOnline do addWoW(i) end
	for i = numBNetFavorite + numBNetOnline + 1, numBNetTotal do addBNet(i) end
	for i = numWoWOnline + 1, numWoWTotal do addWoW(i) end

	if #friends == 0 then
		friends[1] = createEmptyInfo()
	end

	return friends
end

function conds.fgroup:getValueText(value)
	local t, v = (":"):split(value, 2)

	if t == "btag" then
		for i = 1, BNGetNumFriends() do
			local accountInfo = C_BattleNet.GetFriendAccountInfo(i)
			if accountInfo.battleTag == v then
				return accountInfo.accountName
			end
		end
	elseif t == "guid" then
		return getNameByGUID(v)
	end

	return RED_FONT_COLOR:WrapTextInColorCode(L["Not Found"])
end

function conds.fgroup:getValueList(value, func)
	local group = {}

	for i = 1, GetNumSubgroupMembers() do
		local unit = "party"..i
		if UnitIsPlayer(unit) then
			local v = "guid:"..UnitGUID(unit)
			group[#group + 1] = createRadioInfo(GetUnitName(unit, true), v, func, v == value)
		end
	end

	if #group == 0 then
		group[1] = createEmptyInfo()
	end

	return {
		createArrowInfo(FRIENDS, getFriendList(value, func)),
		createArrowInfo(PARTY, group),
	}
end


---------------------------------------------------
-- fraid FRIEND IN RAID
conds.fraid.text = L["Friend in Raid"]

conds.fraid.getValueText = conds.fgroup.getValueText

function conds.fraid:getValueList(value, func)
	local group = {}

	for i = 1, GetNumGroupMembers() do
		local unit = "raid"..i
		if UnitIsPlayer(unit) and not UnitIsUnit(unit, "player") then
			local v = "guid:"..UnitGUID(unit)
			group[#group + 1] = createRadioInfo(GetUnitName(unit, true), v, func, v == value)
		end
	end

	if #group == 0 then
		group[1] = createEmptyInfo()
	end

	return {
		createArrowInfo(FRIENDS, getFriendList(value, func)),
		createArrowInfo(RAID, group),
	}
end


---------------------------------------------------
-- title
conds.title.text = PAPERDOLL_SIDEBAR_TITLES
conds.title.onlyOne = true

function conds.title:getValueText(values)
	local names = {}
	for i, value in ipairs(values) do
		names[i] = GetTitleName(value)
	end
	return concat(names, "; ")
end

function conds.title.sort(values)
	sort(values, function(a, b)
		if a == b then return false end

		local val = strcmputf8i(GetTitleName(a), GetTitleName(b))
		if val ~= 0 then return val < 0 end

		return a < b
	end)
end

function conds.title:getValueList(values, func)
	local list = {}
	local checked = function(btn) return tContains(values, btn.value) end

	for i = 1, GetNumTitles() do
		local name, show = GetTitleName(i)
		if show then
			local text = IsTitleKnown(i) and ("%s (|cff00cc00%s|r)"):format(name, GARRISON_MISSION_ADDED_TOAST2) or name
			list[#list + 1] = createCheckableInfo(text, i, func, checked, sID:format(i))
		end
	end

	sort(list, function(a, b)
		if a == b then return false end

		local checkedA = a:checked()
		local checkedB = b:checked()
		if checkedA and not checkedB then return true
		elseif not checkedA and checkedB then return false end

		if a.text ~= b.text then return strcmputf8i(a.text, b.text) < 0 end
		return a.value < b.value
	end)

	return list
end


---------------------------------------------------
-- METHODS
function conds:getMenuList(value, func, rule)
	local list, keys = {}, {}

	for i, cond in ipairs(rule) do
		if cond[2] and cond[2] ~= value then keys[cond[2]] = true end
	end

	local OnTooltipShow = function(btn, tooltip, v)
		GameTooltip_SetTitle(tooltip, v.text)
		if v.description then tooltip:AddLine(v.description, nil, nil, nil, true) end
	end

	for k, v in next, self do
		if type(v) == "table" and not (v.onlyOne and keys[k]) then
			local info = createRadioInfo(v.text, k, func, k == value)
			info.arg1 = v
			if v.description then
				info.OnTooltipShow = OnTooltipShow
			end
			list[#list + 1] = info
		end
	end
	sort(list, function(a, b) return strcmputf8i(a.text, b.text) < 0 end)
	return list
end
