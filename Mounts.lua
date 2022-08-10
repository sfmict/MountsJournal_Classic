local addon = ...
local C_Map, MapUtil, next, wipe, random, C_PetJournal, IsSpellKnown, GetTime, IsFlyableArea, IsSubmerged, GetInstanceInfo, IsIndoors, UnitInVehicle, IsMounted, InCombatLockdown, GetSpellCooldown, UnitBuff = C_Map, MapUtil, next, wipe, random, C_PetJournal, IsSpellKnown, GetTime, IsFlyableArea, IsSubmerged, GetInstanceInfo, IsIndoors, UnitInVehicle, IsMounted, InCombatLockdown, GetSpellCooldown, UnitBuff
local util = MountsJournalUtil
local mounts = CreateFrame("Frame", "MountsJournal")


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
		self.globalDB.filters = self.globalDB.filters or {}
		self.globalDB.defFilters = self.globalDB.defFilters or {}
		self.globalDB.config = self.globalDB.config or {}
		self.globalDB.mountFavoritesList = self.globalDB.mountFavoritesList or {}
		self.globalDB.mountAnimations = self.globalDB.mountAnimations or {}
		self.globalDB.defProfile = self.globalDB.defProfile or {}
		self.globalDB.mountsProfiles = self.globalDB.mountsProfiles or {}

		self.defProfile = self.globalDB.defProfile
		self:checkProfile(self.defProfile)
		self.profiles = self.globalDB.mountsProfiles
		for name, profile in next, self.profiles do
			self:checkProfile(profile)
		end
		self.filters = self.globalDB.filters
		self.defFilters = self.globalDB.defFilters
		self.mountFavoritesList = self.globalDB.mountFavoritesList
		self.config = self.globalDB.config
		if self.config.mountDescriptionToggle == nil then
			self.config.mountDescriptionToggle = true
		end
		if self.config.arrowButtonsBrowse == nil then
			self.config.arrowButtonsBrowse = true
		end
		if self.config.openHyperlinks == nil then
			self.config.openHyperlinks = true
		end
		self.config.useRepairMountsDurability = self.config.useRepairMountsDurability or 41
		self.config.useRepairFlyableDurability = self.config.useRepairFlyableDurability or 31
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
		self.charDB.profileBySpecializationPVP = self.charDB.profileBySpecializationPVP or {}

		-- Списки
		self.indexBySpellID = {}
		self.indexPetBySpellID = {}
		self.sFlags = {}
		self.repairMounts = {
			61425,
			61447,
		}
		self.usableRepairMounts = {}

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
			OnEnter = function(self)
				-- GameTooltip:SetOwner(self)
			end,
			OnLeave = function(self)
				-- GameTooltip:Hide()
			end,
		})

		LibStub("LibDBIcon-1.0"):Register(addon, ldb_icon, mounts.config.omb)

		-- TEMP
		-- for i, t in ipairs(self.mountsDB) do
		-- 	local spellID, creatureID, mType, sourceType, mountFaction, expansion = unpack(t)
		-- 	local name, _, icon = GetSpellInfo(spellID)
		-- 	if expansion <= 3 and not name or expansion > 3 and name then
		-- 		fprint(spellID, expansion, GetSpellInfo(spellID))
		-- 	end
		-- end
		-- local minItemID
		-- for itemID, spellID in pairs(self.itemIDToSpellID) do
		-- 	if not GetSpellInfo(spellID) then
		-- 		self.itemIDToSpellID[itemID] = nil
		-- 		if not minItemID or minItemID > itemID then minItemID = itemID end
		-- 	end
		-- end
		-- fprint("min", minItemID)
		-- for itemID, spellID in pairs(self.itemIDToSpellID) do
		-- 	if minItemID and itemID > minItemID then fprint(itemID) end
		-- end
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
	-- INIT
	self:setModifier(self.config.modifier)
	self:updateIndexBySpellID()
	self:updateIndexPetBySpellID()
	self:setUsableRepairMounts()
	self:init()

	-- MAP CHANGED
	-- self:RegisterEvent("NEW_WMO_CHUNK")
	-- self:RegisterEvent("ZONE_CHANGED")
	-- self:RegisterEvent("ZONE_CHANGED_INDOORS")
	-- self:RegisterEvent("ZONE_CHANGED_NEW_AREA")

	-- INSTANCE INFO UPDATE
	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	-- MOUNT ADDED
	self:RegisterEvent("COMPANION_UPDATE")
	self:RegisterEvent("COMPANION_LEARNED")
	-- self:RegisterEvent("COMPANION_UNLEARNED")
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
	local playerFaction = UnitFactionGroup("Player")

	wipe(self.usableRepairMounts)
	for i = 1, #self.repairMounts do
		local spellID = self.repairMounts[i]
		local faction = util.getMountInfoBySpellID(spellID)

		if faction == 1 and playerFaction == "Horde"
		or faction == 2 and playerFaction == "Alliance" then
			mounts.config.repairSelectedMount = spellID
		end

		if self.indexBySpellID[spellID] then
			self.usableRepairMounts[spellID] = true
		end
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


function mounts:summonPet(spellID)
	local petID = self.petForMount[spellID]
	if not petID or InCombatLockdown() then return end

	local groupType = util.getGroupType()
	if self.config.noPetInRaid and groupType == "raid"
	or self.config.noPetInGroup and groupType == "group" then
		return
	end

	if type(petID) == "number" then
		local petIndex = mounts.indexPetBySpellID[petID]
		if not petIndex then return end

		local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo("CRITTER", petIndex)
		if not isSummoned then CallCompanion("CRITTER", petIndex) end
	else
		local num = GetNumCompanions("CRITTER")
		if num == 0 then return end
		local petIndex

		if num > 1 then
			petIndex = random(num)
			local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo("CRITTER", petIndex)
			if isSummoned then petIndex = petIndex + 1 end
			if petIndex > num then petIndex = 1 end
		else
			local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo("CRITTER", 1)
			if not isSummoned then petIndex = 1 end
		end

		if petIndex then CallCompanion("CRITTER", petIndex) end
	end
end


function mounts:updateIndexBySpellID()
	wipe(self.indexBySpellID)
	for i = 1, GetNumCompanions("MOUNT") do
		local _,_, spellID = GetCompanionInfo("MOUNT", i)
		self.indexBySpellID[spellID] = i
	end
end


function mounts:updateIndexPetBySpellID()
	wipe(self.indexPetBySpellID)
	for i = 1, GetNumCompanions("CRITTER") do
		local _,_, spellID = GetCompanionInfo("CRITTER", i)
		self.indexPetBySpellID[spellID] = i
	end
end


function mounts:COMPANION_LEARNED(companionType)
	if not companionType then
		local num = GetNumCompanions("MOUNT")
		if num ~= #self.indexBySpellID then
			local t = util:copyTable(self.indexBySpellID)
			self:updateIndexBySpellID()
			for spellID in pairs(self.indexBySpellID) do
				if not t[spellID] then
					self:autoAddNewMount(spellID)
					return
				end
			end
		end
		num = GetNumCompanions("CRITTER")
		if num ~= #self.indexPetBySpellID then
			self:updateIndexPetBySpellID()
		end
	end
end
mounts.COMPANION_UPDATE = mounts.COMPANION_LEARNED


do
	local canUseInstances = {
		[530] = true,
		[571] = true,
		[558] = true,
		[543] = true,
		[585] = true,
		[557] = true,
		[560] = true,
		[556] = true,
		[555] = true,
		[552] = true,
		[269] = true,
		[542] = true,
		[553] = true,
		[554] = true,
		[540] = true,
		[547] = true,
		[545] = true,
		[546] = true,
		[619] = true,
		[601] = true,
		[600] = true,
		[604] = true,
		[602] = true,
		[668] = true,
		[599] = true,
		[658] = true,
		[595] = true,
		[632] = true,
		[576] = true,
		[578] = true,
		[608] = true,
		[650] = true,
		[574] = true,
		[575] = true,
	}

	function mounts:isUsable(spellID)
		if not self.indexBySpellID[spellID] then return false end
		local faction, creatureID, mountType = util.getMountInfoBySpellID(spellID)
		if mountType == 1 and not canUseInstances[self.instanceID] then return false end
		return true
	end
end


function mounts:addMountToList(list, spellID)
	local faction, creatureID, mountType = util.getMountInfoBySpellID(spellID)

	if mountType == 1 then
		mountType = "fly"
	elseif mountType == 2 then
		mountType = "ground"
	else
		mountType = "swimming"
	end

	list[mountType][mountID] = true
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
	local mapInfo = self.mapInfo
	local zoneMounts = self.zoneMounts
	self.mapFlags = nil
	self.list = nil

	while mapInfo and mapInfo.mapID ~= self.defMountsListID do
		local list = zoneMounts[mapInfo.mapID]
		if list then
			if not self.mapFlags and list.flags.enableFlags then
				self.mapFlags = list.flags
			end
			if not self.list then
				while list and list.listFromID do
					if list.listFromID == self.defMountsListID then
						list = self.db
					else
						list = zoneMounts[list.listFromID]
					end
				end
				if list and (next(list.fly) or next(list.ground) or next(list.swimming)) then
					self.list = list
				end
			end
			if self.list and self.mapFlags then return end
		end
		mapInfo = C_Map.GetMapInfo(mapInfo.parentMapID)
	end
	if not self.list then
		self.list = self.db
	end
end
-- mounts.NEW_WMO_CHUNK = mounts.setMountsList
-- mounts.ZONE_CHANGED = mounts.setMountsList
-- mounts.ZONE_CHANGED_INDOORS = mounts.setMountsList
-- mounts.ZONE_CHANGED_NEW_AREA = mounts.setMountsList


function mounts:setDB()
	profileName = self.charDB.profileBySpecializationPVP[1]
	if profileName and not self.profiles[profileName] then
		self.charDB.profileBySpecializationPVP[1] = nil
	end

	if self.charDB.currentProfileName and not self.profiles[self.charDB.currentProfileName] then
		self.charDB.currentProfileName = nil
	end

	local currentProfileName
	if self.pvp and self.charDB.profileBySpecializationPVP.enable then
		currentProfileName = self.charDB.profileBySpecializationPVP[1]
	else
		currentProfileName = self.charDB.currentProfileName
	end

	self.db = currentProfileName and self.profiles[currentProfileName] or self.defProfile
	self.zoneMounts = self.db.zoneMountsFromProfile and self.defProfile.zoneMounts or self.db.zoneMounts
	self.petForMount = self.db.petListFromProfile and self.defProfile.petForMount or self.db.petForMount
	self.mountsWeight = self.db.mountsWeight

	-- self:setMountsList()
end
mounts.PLAYER_SPECIALIZATION_CHANGED = mounts.setDB


function mounts:summonTarget()
	if self.config.copyMountTarget then
		local i = 1
		repeat
			local _,_,_,_,_,_,_,_,_, spellID = UnitBuff("target", i)
			if spellID then
				local index = self.indexBySpellID[spellID]
				if index then
					if self:isUsable(spellID) then
						self:summonPet(spellID)
						CallCompanion("MOUNT", index)
					end
					return true
				end
				i = i + 1
			end
		until not spellID
	end
end


do
	local usableIDs = {}
	function mounts:summon(ids)
		local weight = 0
		for spellID in next, ids do
			if self:isUsable(spellID) then
				weight = weight + (self.mountsWeight[spellID] or 100)
				usableIDs[weight] = spellID
			end
		end
		if weight > 0 then
			for i = random(weight), weight do
				if usableIDs[i] then
					local spellID = usableIDs[i]
					self:summonPet(spellID)
					CallCompanion("MOUNT", self.indexBySpellID[spellID])
					break
				end
			end
			wipe(usableIDs)
			return true
		else
			return false
		end
	end
end


function mounts:isWaterWalkLocation()
	return self.mapFlags and self.mapFlags.waterWalkOnly or false
end


function mounts:setFlags()
	self.mapInfo = C_Map.GetMapInfo(MapUtil.GetDisplayableMapForPlayer())
	local flags = self.sFlags
	local modifier = self.modifier() or flags.forceModifier
	local isFlyableLocation = IsFlyableArea()
	                          and not (self.mapFlags and self.mapFlags.groundOnly)

	flags.isSubmerged = IsSubmerged()
	flags.isIndoors = IsIndoors()
	flags.inVehicle = UnitInVehicle("player")
	flags.isMounted = IsMounted()
	flags.swimming = flags.isSubmerged
	                 and not modifier
	flags.fly = isFlyableLocation
	            and (not modifier or flags.isSubmerged)
	flags.waterWalk = not isFlyableLocation and modifier
	                  or self:isWaterWalkLocation()
end

function mounts:errorSummon()
	UIErrorsFrame:AddMessage(InCombatLockdown() and SPELL_FAILED_AFFECTING_COMBAT or ERR_MOUNT_NO_FAVORITES, 1, .1, .1, 1)
end


function mounts:init()
	SLASH_MOUNTSJOURNAL1 = "/mount"
	SlashCmdList["MOUNTSJOURNAL"] = function(msg)
		local flags = self.sFlags
		if msg ~= "doNotSetFlags" then
			flags.forceModifier = nil
			self:setFlags()
		end
		self:setMountsList()
		if flags.inVehicle then
			VehicleExit()
		elseif flags.isMounted then
			Dismount()
		-- repair mounts
		elseif not ((flags.repair and not flags.fly or flags.flyableRepair and flags.fly) and self:summon(self.usableRepairMounts))
		-- target's mount
		and not self:summonTarget()
		-- swimming
		and not (flags.swimming and self:summon(self.list.swimming))
		-- fly
		and not (flags.fly and self:summon(self.list.fly))
		-- ground
		and not self:summon(self.list.ground)
		and not self:summon(self.list.fly)
		then
			self:errorSummon()
		end
	end
end