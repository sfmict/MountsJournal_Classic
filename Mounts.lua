local addon, L = ...
local C_MountJournal, C_Map, MapUtil, next, wipe, random, IsPlayerSpell, IsSpellKnown, GetTime, IsFlyableArea, IsSubmerged, GetInstanceInfo, IsIndoors, UnitInVehicle, IsMounted, InCombatLockdown, GetSpellCooldown, IsUsableSpell, SecureCmdOptionParse, UnitLevel, BACKPACK_CONTAINER, NUM_BAG_SLOTS, C_Container = C_MountJournal, C_Map, MapUtil, next, wipe, random, IsPlayerSpell, IsSpellKnown, GetTime, IsFlyableArea, IsSubmerged, GetInstanceInfo, IsIndoors, UnitInVehicle, IsMounted, InCombatLockdown, GetSpellCooldown, IsUsableSpell, SecureCmdOptionParse, UnitLevel, BACKPACK_CONTAINER, NUM_BAG_SLOTS, C_Container
local util = MountsJournalUtil
local mounts = CreateFrame("Frame", "MountsJournal")
util.setEventsMixin(mounts)


mounts:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
mounts:RegisterEvent("ADDON_LOADED")
mounts:RegisterEvent("PLAYER_LOGIN")
mounts:RegisterEvent("UPDATE_INVENTORY_DURABILITY")


function mounts:ADDON_LOADED(addonName)
	if addonName == addon then
		self:UnregisterEvent("ADDON_LOADED")

		local mapInfo = MapUtil.GetMapParentInfo(C_Map.GetFallbackWorldMapID(), Enum.UIMapType.Cosmic, true)
		self.defMountsListID = mapInfo and mapInfo.mapID or 946 -- WORLD

		MountsJournalDB = MountsJournalDB or {}
		self.globalDB = MountsJournalDB
		self.globalDB.mountTags = self.globalDB.mountTags or {}
		self.globalDB.additionalFavorites = self.globalDB.additionalFavorites or {}
		self.globalDB.filters = self.globalDB.filters or {}
		self.globalDB.defFilters = self.globalDB.defFilters or {}
		self.globalDB.config = self.globalDB.config or {}
		self.globalDB.mountAnimations = self.globalDB.mountAnimations or {}
		self.globalDB.defProfile = self.globalDB.defProfile or {}
		self.globalDB.mountsProfiles = self.globalDB.mountsProfiles or {}
		self.globalDB.holidayNames = self.globalDB.holidayNames or {}

		self.defProfile = self.globalDB.defProfile
		self:checkProfile(self.defProfile)
		self.profiles = self.globalDB.mountsProfiles
		for name, profile in next, self.profiles do
			self:checkProfile(profile)
		end
		self.additionalFavorites = self.globalDB.additionalFavorites
		self.filters = self.globalDB.filters
		self.defFilters = self.globalDB.defFilters
		self.config = self.globalDB.config
		self.config.wowheadLinkLang = self.config.wowheadLinkLang or "en"
		if self.config.mountDescriptionToggle == nil then
			self.config.mountDescriptionToggle = true
		end
		if self.config.arrowButtonsBrowse == nil then
			self.config.arrowButtonsBrowse = true
		end
		if self.config.openHyperlinks == nil then
			self.config.openHyperlinks = true
		end
		if self.config.showWowheadLink == nil then
			self.config.showWowheadLink = true
		end
		self.config.useRepairMountsDurability = self.config.useRepairMountsDurability or 41
		self.config.useRepairFlyableDurability = self.config.useRepairFlyableDurability or 31
		self.config.useRepairFreeSlotsNum = self.config.useRepairFreeSlotsNum or 1
		self.config.summonPetEveryN = self.config.summonPetEveryN or 5
		self.config.macrosConfig = self.config.macrosConfig or {}
		for i = 1, GetNumClasses() do
			local _, className = GetClassInfo(i)
			if className then
				self.config.macrosConfig[className] = self.config.macrosConfig[className] or {}
			end
		end
		self.config.omb = self.config.omb or {}
		self.config.camera = self.config.camera or {}
		self.cameraConfig = self.config.camera
		if self.cameraConfig.xAccelerationEnabled == nil then
			self.cameraConfig.xAccelerationEnabled = true
		end
		self.cameraConfig.xInitialAcceleration = self.cameraConfig.xInitialAcceleration or .5
		self.cameraConfig.xAcceleration = self.cameraConfig.xAcceleration or -1
		self.cameraConfig.xMinAcceleration = nil
		self.cameraConfig.xMinSpeed = self.cameraConfig.xMinSpeed or 0
		if self.cameraConfig.yAccelerationEnabled == nil then
			self.cameraConfig.yAccelerationEnabled = true
		end
		self.cameraConfig.yInitialAcceleration = self.cameraConfig.yInitialAcceleration or .5
		self.cameraConfig.yAcceleration = self.cameraConfig.yAcceleration or -1
		self.cameraConfig.yMinAcceleration = nil
		self.cameraConfig.yMinSpeed = self.cameraConfig.yMinSpeed or 0

		MountsJournalChar = MountsJournalChar or {}
		self.charDB = MountsJournalChar
		self.charDB.macrosConfig = self.charDB.macrosConfig or {}
		self.charDB.profileBySpecialization = self.charDB.profileBySpecialization or {}
		self.charDB.profileBySpecializationPVP = self.charDB.profileBySpecializationPVP or {}
		self.charDB.holidayProfiles = self.charDB.holidayProfiles or {}

		self:setOldChanges()

		-- Списки
		self.swimmingVashjir = {
			[75207] = true,
		}

		self.sFlags = {}
		self.priorityProfiles = {}
		self.list = {}
		self.empty = {}

		self.mapVashjir = {
			[201] = true, -- Лес Келп’тар
			[203] = true, -- Вайш'ир
			[204] = true, -- Бездонные глубины
			[205] = true, -- Мерцающий простор
		}

		self.usableRepairMounts = {}
		self.usableIDs = {}

		-- MINIMAP BUTTON
		local ldb_icon = LibStub("LibDataBroker-1.1"):NewDataObject(addon, {
			type = "launcher",
			text = addon,
			icon = 303868,
			OnClick = function(_, button)
				if button == "LeftButton" then
					MountsJournalFrame:showToggle()
				elseif button == "RightButton" then
					MountsJournalConfig:openConfig()
				end
			end,
			OnTooltipShow = function(tooltip)
				tooltip:SetText(("%s (|cffff7f3f%s|r)"):format(addon, C_AddOns.GetAddOnMetadata(addon, "Version")))
				tooltip:AddLine("\n")
				tooltip:AddLine(L["|cffff7f3fClick|r to open %s"]:format(addon), .5, .8, .5, false)
				tooltip:AddLine(L["|cffff7f3fRight-Click|r to open Settings"], .5, .8, .5, false)
				if InCombatLockdown() then
					GameTooltip_AddErrorLine(GameTooltip, SPELL_FAILED_AFFECTING_COMBAT)
				end
			end,
		})
		LibStub("LibDBIcon-1.0"):Register(addon, ldb_icon, mounts.config.omb)
	end
end


function mounts:checkProfile(profile)
	profile.fly = profile.fly or {}
	profile.ground = profile.ground or {}
	profile.swimming = profile.swimming or {}
	profile.zoneMounts = profile.zoneMounts or {}
	profile.petForMount = profile.petForMount or {}
	profile.mountsWeight = profile.mountsWeight or {}
end


function mounts:PLAYER_LOGIN()
	if self.after then
		for i = 1, #self.after do
			self.after[i]()
		end
		self.after = nil
	end

	-- INIT
	self:setModifier(self.config.modifier)
	self:setHandleWaterJump(self.config.waterJump)
	self:setUsableRepairMounts()
	self:updateProfessionsRank()
	self:init()
	self.pets:setSummonEvery()
	self.calendar:init()

	-- MAP CHANGED
	-- self:RegisterEvent("NEW_WMO_CHUNK")
	-- self:RegisterEvent("ZONE_CHANGED")
	-- self:RegisterEvent("ZONE_CHANGED_INDOORS")
	-- self:RegisterEvent("ZONE_CHANGED_NEW_AREA")

	-- INSTANCE INFO UPDATE
	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	-- PROFESSION CHANGED
	self:RegisterEvent("SKILL_LINES_CHANGED")

	-- MOUNT ADDED
	self:RegisterEvent("NEW_MOUNT_ADDED")
	-- self:RegisterEvent("COMPANION_UPDATE")
	-- self:RegisterEvent("COMPANION_LEARNED")
	-- self:RegisterEvent("COMPANION_UNLEARNED")

	-- DUAL SPEC CHANGED
	self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")

	-- PET USABLE
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")

	-- CALENDAR
	self:on("CALENDAR_UPDATE_EVENT_LIST", self.setDB)
end


do
	local durabilitySlots = {
		INVSLOT_HEAD,
		INVSLOT_SHOULDER,
		INVSLOT_CHEST,
		INVSLOT_WRIST,
		INVSLOT_HAND,
		INVSLOT_WAIST,
		INVSLOT_LEGS,
		INVSLOT_FEET,
		INVSLOT_MAINHAND,
		INVSLOT_OFFHAND,
		INVSLOT_RANGED,
	}
	function mounts:UPDATE_INVENTORY_DURABILITY()
		local percent = (tonumber(self.config.useRepairMountsDurability) or 0) / 100
		local flyablePercent = (tonumber(self.config.useRepairFlyableDurability) or 0) / 100
		self.sFlags.repair = false
		self.sFlags.flyableRepair = false
		if self.config.useRepairMounts then
			for i = 1, #durabilitySlots do
				local durCur, durMax = GetInventoryItemDurability(durabilitySlots[i])
				if durCur and durMax then
					local itemPercent = durCur / durMax
					if itemPercent < percent then
						self.sFlags.repair = true
					end
					if itemPercent < flyablePercent then
						self.sFlags.flyableRepair = true
					end
				end
			end
			if not self.config.useRepairFlyable then
				self.sFlags.flyableRepair = self.sFlags.repair
			end
		end
	end
end


function mounts:setUsableRepairMounts()
	wipe(self.usableRepairMounts)
	for spellID in pairs(self.specificDB.repair) do
		local mountID = C_MountJournal.GetMountFromSpell(spellID)
		local _,_,_,_,_,_,_,_,_, shouldHideOnChar, isCollected = C_MountJournal.GetMountInfoByID(mountID)

		if not shouldHideOnChar then
			mounts.config.repairSelectedMount = spellID
			if isCollected then
				self.usableRepairMounts[spellID] = true
			end
			break
		end
	end
end


function mounts:notEnoughFreeSlots()
	if self.config.useRepairFreeSlots then
		local totalFree, freeSlots, bagFamily = 0
		for i = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
			freeSlots, bagFamily = C_Container.GetContainerNumFreeSlots(i)
			if bagFamily == 0 then totalFree = totalFree + freeSlots end
		end
		return totalFree < self.config.useRepairFreeSlotsNum
	end
end


function mounts:PLAYER_ENTERING_WORLD()
	local _, instanceType, _,_,_,_,_, instanceID = GetInstanceInfo()
	self.instanceID = instanceID
	local pvp = instanceType == "arena" or instanceType == "pvp"
	if self.pvp ~= pvp then
		self.pvp = pvp
		self:setDB()
	end
end


function mounts:PLAYER_REGEN_DISABLED()
	self:UnregisterEvent("UNIT_SPELLCAST_START")
end


function mounts:PLAYER_REGEN_ENABLED()
	self:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")
end


do
	local function summonPet(petID)
		if InCombatLockdown() then return end
		if type(petID) == "number" then
			mounts.pets:summonRandomPet(petID == 1)
		else
			mounts.pets:summon(petID)
		end
	end


	local timer
	function mounts:UNIT_SPELLCAST_START(_,_, spellID)
		local petID
		for i = 1, #self.priorityProfiles do
			petID = self.priorityProfiles[i].petForMount[spellID]
			if petID then break end
		end

		if petID then
			local groupType = util.getGroupType()
			if self.config.noPetInRaid and groupType == "raid"
			or self.config.noPetInGroup and groupType == "group"
			then return end

			if timer and not timer:IsCancelled() then
				timer:Cancel()
				timer = nil
			end

			local start, duration = GetSpellCooldown(61304)

			if duration == 0 then
				summonPet(petID)
			else
				timer = C_Timer.NewTicker(start + duration - GetTime(), function() summonPet(petID) end, 1)
			end
		end
	end
end


function mounts:NEW_MOUNT_ADDED(mountID)
	local _, spellID = C_MountJournal.GetMountInfoByID(mountID)
	self:autoAddNewMount(spellID)
end


function mounts:updateProfessionsRank()
	local engineeringName = GetSpellInfo(4036)
	local tailoringName = GetSpellInfo(3908)

	self.engineeringRank = nil
	self.tailoringRank = nil

	for i = 1, GetNumSkillLines() do
		local skillName, _,_, skillRank = GetSkillLineInfo(i)
		if skillName == engineeringName then
			self.engineeringRank = skillRank
		elseif skillName == tailoringName then
			self.tailoringRank = skillRank
		end
	end
end
mounts.SKILL_LINES_CHANGED = mounts.updateProfessionsRank


do
	local mountsRequiringProf = {
		[44151] = {"engineeringRank", 375}, -- 204 Turbo-Charged Flying Machine
		[44153] = {"engineeringRank", 300}, -- 205 Flying Machine
		[61309] = {"tailoringRank", 425}, -- 279 Magnificent Flying Carpet
		[61451] = {"tailoringRank", 300}, -- 285 Flying Carpet
		[75596] = {"tailoringRank", 425}, -- 375 Frosty Flying Carpet
	}

	local levelDependent = {
		[23161] = true, -- Dreadsteed
		[23214] = true, -- Summon Charger
		[34767] = true, -- Thalassian Charger
		[69826] = true, -- Summon Great Sunwalker Kodo
		[73630] = true, -- Summon Great Exarch's Elekk
	}

	function mounts:isUsable(spellID)
		local prof = mountsRequiringProf[spellID]
		if prof and (self[prof[1]] or 0) < prof[2]
		or levelDependent[spellID] and UnitLevel("player") < 40
		then return false end
		return IsUsableSpell(spellID)
	end
end


do
	local function addMount(list, mountType, spellID)
		if mountType == 1 then
			mountType = "fly"
		elseif mountType == 2 then
			mountType = "ground"
		else
			mountType = "swimming"
		end

		list[mountType][spellID] = true
	end


	function mounts:addMountToList(list, spellID)
		local mountType
		if self.additionalMounts[spellID] then
			mountType = util.mountTypes[self.additionalMounts[spellID].mountType]
		else
			local mountID = C_MountJournal.GetMountFromSpell(spellID)
			local _,_,_,_, mountTypeExtra = C_MountJournal.GetMountInfoExtraByID(mountID)
			mountType = util.mountTypes[mountTypeExtra]
		end

		if type(mountType) == "table" then
			for i = 1, #mountType do
				addMount(list, mountType[i], spellID)
			end
		else
			addMount(list, mountType, spellID)
		end
	end
end


function mounts:autoAddNewMount(spellID)
	if self.defProfile.autoAddNewMount then
		self:addMountToList(self.defProfile, spellID)
	end

	for _, profile in next, self.profiles do
		if profile.autoAddNewMount then
			self:addMountToList(profile, spellID)
		end
	end
end


function mounts:setModifier(modifier)
	if modifier == "NONE" then
		self.config.modifier = modifier
		self.modifier = function() return false end
	elseif modifier == "SHIFT" then
		self.config.modifier = modifier
		self.modifier = IsShiftKeyDown
	elseif modifier == "CTRL" then
		self.config.modifier = modifier
		self.modifier = IsControlKeyDown
	else
		self.config.modifier = "ALT"
		self.modifier = IsAltKeyDown
	end
end


function mounts:setMountsList()
	self.mapInfo = C_Map.GetMapInfo(C_Map.GetBestMapForUnit("player") or C_Map.GetFallbackWorldMapID())
	local mapInfo = self.mapInfo
	local zoneMounts = self.zoneMounts
	self.mapFlags = nil
	wipe(self.list)

	local mapInfo = self.mapInfo
	while mapInfo do
		for i = 1, #self.priorityProfiles do
			local profile, list = self.priorityProfiles[i]

			if mapInfo.mapID == self.defMountsListID then
				list = profile
			else
				local zoneMounts = profile.zoneMountsFromProfile and self.defProfile.zoneMounts or profile.zoneMounts
				list = zoneMounts[mapInfo.mapID]

				if list and not self.mapFlags and list.flags.enableFlags then
					self.mapFlags = list.flags
				end
			end

			if list then
				if not (self.list.fly and self.list.ground and self.list.swimming) then
					while list and list.listFromID do
						if list.listFromID == self.defMountsListID then
							list = profile
						else
							list = zoneMounts[list.listFromID]
						end
					end
					if list then
						if not self.list.fly and next(list.fly) then
							self.list.fly = list.fly
							self.list.flyWeight = profile.mountsWeight
						end
						if not self.list.ground and next(list.ground) then
							self.list.ground = list.ground
							self.list.groundWeight = profile.mountsWeight
						end
						if not self.list.swimming and next(list.swimming) then
							self.list.swimming = list.swimming
							self.list.swimmingWeight = profile.mountsWeight
						end
					end
				elseif self.mapFlags then return end
			end
		end

		if mapInfo.parentMapID == 0 and mapInfo.mapID ~= self.defMountsListID then
			mapInfo = C_Map.GetMapInfo(self.defMountsListID)
		else
			mapInfo = C_Map.GetMapInfo(mapInfo.parentMapID)
		end
	end

	if not self.list.fly then self.list.fly = self.empty end
	if not self.list.ground then self.list.ground = self.empty end
	if not self.list.swimming then self.list.swimming = self.empty end
end
-- mounts.NEW_WMO_CHUNK = mounts.setMountsList
-- mounts.ZONE_CHANGED = mounts.setMountsList
-- mounts.ZONE_CHANGED_INDOORS = mounts.setMountsList
-- mounts.ZONE_CHANGED_NEW_AREA = mounts.setMountsList


function mounts:setDB()
	local profileName
	for i = 1, GetNumTalentGroups(false, false) do
		profileName = self.charDB.profileBySpecialization[i]
		if profileName and not self.profiles[profileName] then
			self.charDB.profileBySpecialization[i] = nil
		end
		profileName = self.charDB.profileBySpecializationPVP[i]
		if profileName and not self.profiles[profileName] then
			self.charDB.profileBySpecializationPVP[i] = nil
		end
	end

	if self.charDB.currentProfileName and not self.profiles[self.charDB.currentProfileName] then
		self.charDB.currentProfileName = nil
	end

	wipe(self.priorityProfiles)

	if self.pvp and self.charDB.profileBySpecializationPVP.enable then
		profileName = self.charDB.profileBySpecializationPVP[GetActiveTalentGroup(false, false)]
		self.priorityProfiles[1] = self.profiles[profileName] or self.defProfile
	end

	local holidayProfiles = self.calendar:getHolidayProfileNames()
	for i = 1, #holidayProfiles do
		self.priorityProfiles[#self.priorityProfiles + 1] = self.profiles[holidayProfiles[i].profileName] or self.defProfile
	end

	if self.charDB.profileBySpecialization.enable then
		profileName = self.charDB.profileBySpecialization[GetActiveTalentGroup(false, false)]
		self.priorityProfiles[#self.priorityProfiles + 1] = self.profiles[profileName] or self.defProfile
	end

	profileName = self.charDB.currentProfileName
	self.db = self.profiles[profileName] or self.defProfile
	self.priorityProfiles[#self.priorityProfiles + 1] = self.db
end
mounts.ACTIVE_TALENT_GROUP_CHANGED = mounts.setDB


function mounts:setHandleWaterJump(enable)
	if type(enable) == "boolean" then
		self.config.waterJump = enable
		local registred = self:IsEventRegistered("MOUNT_JOURNAL_USABILITY_CHANGED")
		if enable then
			if not registred then
				self:RegisterEvent("MOUNT_JOURNAL_USABILITY_CHANGED")
			end
		else
			if registred then
				self:UnregisterEvent("MOUNT_JOURNAL_USABILITY_CHANGED")
			end
		end
	end
end


function mounts:MOUNT_JOURNAL_USABILITY_CHANGED()
	if not IsSubmerged() then
		self.lastJumpTime = GetTime()
	end
end


function mounts:isFloating()
	return self.config.waterJump and GetTime() - (self.lastJumpTime or 0) < 1
end


function mounts:getTargetMount()
	if self.config.copyMountTarget then
		local spellID, mountID = util.getUnitMount("target")
		if mountID then
			local _,_,_,_, isUsable = C_MountJournal.GetMountInfoByID(mountID)
			return isUsable and self:isUsable(spellID) and spellID
		elseif spellID then
			return self.additionalMounts[spellID]:canUse() and spellID
		end
	end
end


function mounts:summon(spellID)
	self.summonedSpellID = spellID or self.summonedSpellID
	if self.summonedSpellID then
		local mountID = C_MountJournal.GetMountFromSpell(self.summonedSpellID)
		if mountID then
			C_MountJournal.SummonByID(mountID)
			return true
		end
	end
end


function mounts:setUsableID(ids, mountsWeight)
	local weight = 0
	wipe(self.usableIDs)

	for spellID in next, ids do
		local usable
		if self.additionalMounts[spellID] then
			usable = self.withAdditional and self.additionalMounts[spellID]:canUse()
		else
			local mountID = C_MountJournal.GetMountFromSpell(spellID)
			if mountID then
				local _,_,_,_, isUsable, _,_,_,_,_,_,_, isForDragonriding = C_MountJournal.GetMountInfoByID(mountID)
				usable = isUsable and self:isUsable(spellID)
			end
		end

		if usable then
			weight = weight + (mountsWeight[spellID] or 100)
			self.usableIDs[weight] = spellID
		end
	end

	if weight > 0 then
		for i = random(weight), weight do
			if self.usableIDs[i] then
				self.summonedSpellID = self.usableIDs[i]
				return true
			end
		end
	end
end


function mounts:getSpellKnown()
	if IsPlayerSpell(90265) -- Мастер верховой езды
	or IsPlayerSpell(34091) -- Верховая езда (искусник)
	or IsPlayerSpell(34090) -- Верховая езда (умелец)
	then
		return true, true
	end

	if IsPlayerSpell(33391) -- Верховая езда (подмастерье)
	or IsPlayerSpell(33388) -- Верховая езда (ученик)
	then
		return true, false
	end

	return false, false
end


do
	local cataInstances = {
		[0] = true,
		[1] = true,
		[646] = true,
	}

	function mounts:isFlyLocation()
		if self.instanceID == 571 then -- Northrend
			return IsSpellKnown(54197)
		elseif cataInstances[self.instanceID] then
			return IsSpellKnown(90267)
		end
		return true
	end
end


function mounts:isWaterWalkLocation()
	return self.mapFlags and self.mapFlags.waterWalkOnly or false
end


function mounts:setFlags()
	self:setMountsList()
	local flags = self.sFlags
	local groundSpellKnown, flySpellKnown = self:getSpellKnown()
	local isFloating = self:isFloating()
	local isFlyableLocation = flySpellKnown
	                          and IsFlyableArea()
	                          and self:isFlyLocation()
	                          and not (self.mapFlags and self.mapFlags.groundOnly)

	flags.modifier = self.modifier() or flags.forceModifier
	flags.isSubmerged = IsSubmerged()
	flags.isIndoors = IsIndoors()
	flags.inVehicle = UnitInVehicle("player")
	flags.isMounted = IsMounted()
	flags.swimming = flags.isSubmerged
	                 and not (flags.modifier or isFloating)
	flags.isVashjir = self.mapVashjir[self.mapInfo.mapID]
	flags.fly = isFlyableLocation
	            and (not flags.modifier or flags.isSubmerged)
	flags.waterWalk = isFloating
	                  or not isFlyableLocation and flags.modifier
	                  or self:isWaterWalkLocation()
	flags.useRepair = flags.repair and not flags.fly
	                  or flags.flyableRepair and flags.fly
	                  or self:notEnoughFreeSlots()
	flags.targetMount = self:getTargetMount()
end


function mounts:errorSummon()
	UIErrorsFrame:AddMessage(InCombatLockdown() and SPELL_FAILED_AFFECTING_COMBAT or L["ERR_MOUNT_NO_SELECTED"], 1, .1, .1, 1)
end


function mounts:setSummonMount(withAdditional)
	self.withAdditional = withAdditional
	self.summonedSpellID = nil
	local flags = self.sFlags
	if flags.inVehicle then
		VehicleExit()
	elseif flags.isMounted then
		Dismount()
	-- repair mounts
	elseif not (flags.useRepair and self:setUsableID(self.usableRepairMounts, self.db.mountsWeight))
	-- target's mount
	and not (flags.targetMount and self:summon(flags.targetMount))
	-- swimming
	and not (flags.swimming and (
		flags.isVashjir and self:setUsableID(self.swimmingVashjir, self.db.mountsWeight)
		or self:setUsableID(self.list.swimming, self.list.swimmingWeight)
	))
	-- fly
	and not (flags.fly and self:setUsableID(self.list.fly, self.list.flyWeight))
	-- ground
	and not self:setUsableID(self.list.ground, self.list.groundWeight)
	and not self:setUsableID(self.list.fly, self.list.flyWeight)
	then
		self:errorSummon()
	end
end


function mounts:init()
	SLASH_MOUNTSJOURNAL1 = "/mount"
	SlashCmdList["MOUNTSJOURNAL"] = function(msg)
		if not SecureCmdOptionParse(msg) then return end
		self.sFlags.forceModifier = nil
		self:setFlags()
		self:setSummonMount()
		self:summon()
	end
end