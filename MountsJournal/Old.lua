local addon, ns = ...


local function compareVersion(v1, v2)
	v1 = v1:gsub("%D*([%d%.]+).*", "%1")
	v2 = (v2 or ""):gsub("%D*([%d%.]+).*", "%1")
	v1 = {("."):split(v1)}
	v2 = {("."):split(v2)}
	for i = 1, min(#v1, #v2) do
		v1[i] = tonumber(v1[i]) or 0
		v2[i] = tonumber(v2[i]) or 0
		if v1[i] > v2[i] then return true end
		if v1[i] < v2[i] then return false end
	end
	return #v1 > #v2
end


local function updateGlobal(self)
	-- IF < 3.4.31 GLOBAL
	if compareVersion("3.4.31", self.globalDB.lastAddonVersion) and self.config.journalPosX then
		self.config.journalPosX = nil
		self.config.journalPosY = nil
		self.globalDB.mountFavoritesList = nil
		self.globalDB.petFavoritesList = nil

		if self.config.repairSelectedMount then
			self.config.repairSelectedMount = C_MountJournal.GetMountFromSpell(self.config.repairSelectedMount)
		end

		local function spellToMount(tbl)
			local newTbl = {}
			for spellID, v in pairs(tbl) do
				local mountID = C_MountJournal.GetMountFromSpell(spellID)
				if mountID then
					newTbl[mountID] = v
				end
			end
			return newTbl
		end

		self.globalDB.mountTags = spellToMount(self.globalDB.mountTags)

		local function getPetIDFromSpellID(spellID)
			local sName = GetSpellInfo(spellID)
			for i, petID in ipairs(self.pets.list) do
				local _,_,_,_,_,_,_, name = C_PetJournal.GetPetInfoByPetID(petID)
				if name == sName then
					return petID
				end
			end
		end

		local petToUpdate = {}
		self:on("PET_LIST_UPDATE.old", function(self)
			if #self.pets.list == 0 then return end
			self:off("PET_LIST_UPDATE.old")

			for i, petForMount in ipairs(petToUpdate) do
				for spellID, v in pairs(petForMount) do
					local mountID = C_MountJournal.GetMountFromSpell(spellID)
					if mountID then
						if v == false then
							petForMount[spellID] = 1
						elseif v == true then
							petForMount[spellID] = 2
						elseif type(v) == "number" then
							petForMount[spellID] = getPetIDFromSpellID(v)
						end
					else
						petForMount[spellID] = nil
					end
				end
			end
		end)

		local function profileUpdate(profile)
			profile.fly = spellToMount(profile.fly)
			profile.ground = spellToMount(profile.ground)
			profile.swimming = spellToMount(profile.swimming)
			profile.mountsWeight = spellToMount(profile.mountsWeight)

			for map, v in pairs(profile.zoneMounts) do
				v.fly = spellToMount(v.fly)
				v.ground = spellToMount(v.ground)
				v.swimming = spellToMount(v.swimming)
			end

			petToUpdate[#petToUpdate + 1] = profile.petForMount
		end

		profileUpdate(self.defProfile)
		for name, profile in next, self.profiles do
			profileUpdate(profile)
		end
	end

	-- IF < 4.4.0 GLOBAL
	if compareVersion("4.4.0", self.globalDB.lastAddonVersion) then
		local function mountToSpell(list)
			local newList = {}
			for mountID, v in next, list do
				local _, spellID = C_MountJournal.GetMountInfoByID(mountID)
				if spellID and spellID > 0 then
					newList[spellID] = v
				end
			end
			return newList
		end

		local function profileToSpell(profile)
			profile.mountsWeight = mountToSpell(profile.mountsWeight)
			profile.fly = mountToSpell(profile.fly)
			profile.ground = mountToSpell(profile.ground)
			profile.swimming = mountToSpell(profile.swimming)

			for mapID, data in next, profile.zoneMounts do
				data.fly = mountToSpell(data.fly)
				data.ground = mountToSpell(data.ground)
				data.swimming = mountToSpell(data.swimming)
			end
		end

		if self.config.repairSelectedMount then
			local _, spellID = C_MountJournal.GetMountInfoByID(self.config.repairSelectedMount)
			self.config.repairSelectedMount = spellID
		end
		if self.globalDB.hiddenMounts then
			self.globalDB.hiddenMounts = mountToSpell(self.globalDB.hiddenMounts)
		end
		self.globalDB.mountTags = mountToSpell(self.globalDB.mountTags)
		profileToSpell(self.defProfile)
		for name, data in next, self.profiles do
			profileToSpell(data)
		end
	end

	-- IF < 4.4.6 GLOBAL
	if compareVersion("4.4.6", self.globalDB.lastAddonVersion) then
		if self.filters.family then wipe(self.filters.family) end
		if self.defFilters.family then wipe(self.defFilters.family) end
	end

	-- IF < 4.4.22 GLOBAL
	if compareVersion("4.4.22", self.globalDB.lastAddonVersion) then
		if self.globalDB.ruleConfig then
			for i, rules in ipairs(self.globalDB.ruleConfig) do
				self.globalDB.ruleSets[1][i] = rules
			end
			self.globalDB.ruleConfig = nil
		end
	end

	-- IF < 5.5.0 GLOBAL
	if compareVersion("5.5.0", self.globalDB.lastAddonVersion) then
		local spells = {}
		for i, mountID in ipairs(C_MountJournal.GetMountIDs()) do
			local _, spellID = C_MountJournal.GetMountInfoByID(mountID)
			spells[spellID] = true
		end

		local function checkSpells(tbl)
			for spellID in next, tbl do
				if not (spells[spellID] or ns.additionalMounts[spellID]) then
					tbl[spellID] = nil
				end
			end
		end

		local function profileUpdate(profile)
			checkSpells(profile.fly)
			checkSpells(profile.ground)
			checkSpells(profile.swimming)
			checkSpells(profile.mountsWeight)
			checkSpells(profile.petForMount)

			for map, v in pairs(profile.zoneMounts) do
				checkSpells(v.fly)
				checkSpells(v.ground)
				checkSpells(v.swimming)
			end
		end

		profileUpdate(self.defProfile)
		for name, profile in next, self.profiles do
			profileUpdate(profile)
		end
	end

	-- IF < 5.5.1 GLOBAL
	if compareVersion("5.5.1", self.globalDB.lastAddonVersion) then
		local family = {}
		for k, v in next, ns.familyDB do
			if type(v) == "table" then
				for k, v in next, v do
					family[v] = true
				end
			else
				family[v] = true
			end
		end

		local function checkFamily(filter)
			for k in next, filter do
				if not family[k] then filter[k] = nil end
			end
		end
		checkFamily(self.filters.family)
		checkFamily(self.defFilters.family)
	end
end


local function updateChar(self)
	-- IF < 4.4.17 CHAR
	if compareVersion("4.4.17", self.charDB.lastAddonVersion) then
		local rules = self.globalDB.ruleConfig and self.globalDB.ruleConfig[1] or self.globalDB.ruleSets[1][1]

		if self.charDB.profileBySpecialization then
			if self.charDB.profileBySpecialization.enable then
				for i = 1, GetNumSpecializations() do
					local profileName = self.charDB.profileBySpecialization[i] or 1
					local specID = C_SpecializationInfo.GetSpecializationInfo(i)
					local rule = {
						{false, "spec", specID},
						action = {"rmount", profileName},
					}
					tinsert(rules, 1, rule)
				end
			end
			self.charDB.profileBySpecialization = nil
		end

		if self.charDB.holidayProfiles then
			local holidays = {}
			for eventID, data in next, self.charDB.holidayProfiles do
				if data.enabled then
					holidays[#holidays + 1] = {eventID, data.profileName or 1, data.order}
				end
			end
			sort(holidays, function(a, b) return a[3] > b[3] end)
			for i, data in ipairs(holidays) do
				local rule = {
					{false, "holiday", data[1]},
					action = {"rmount", data[2]},
				}
				tinsert(rules, 1, rule)
			end
			self.charDB.holidayProfiles = nil
		end

		if self.charDB.profileBySpecializationPVP then
			if self.charDB.profileBySpecializationPVP.enable then
				for i = 1, GetNumSpecializations() do
					local profileName = self.charDB.profileBySpecializationPVP[i] or 1
					local specID = C_SpecializationInfo.GetSpecializationInfo(i)
					local rule1 = {
						{false, "spec", specID},
						{false, "zt", "arena"},
						action = {"rmount", profileName},
					}
					local rule2 = {
						{false, "spec", specID},
						{false, "zt", "pvp"},
						action = {"rmount", profileName},
					}
					tinsert(rules, 1, rule1)
					tinsert(rules, 1, rule2)
				end
			end
			self.charDB.profileBySpecializationPVP = nil
		end
	end
end


function ns.mounts:setOldChanges()
	self.setOldChanges = nil

	local currentVersion = C_AddOns.GetAddOnMetadata(addon, "Version")
	--@do-not-package@
	if currentVersion == "@project-version@" then currentVersion = "v5.5.1" end
	--@end-do-not-package@

	if not self.charDB.lastAddonVersion then self.charDB.lastAddonVersion = currentVersion end
	if not self.globalDB.lastAddonVersion then self.globalDB.lastAddonVersion = currentVersion end

	if compareVersion(currentVersion, self.charDB.lastAddonVersion) then
		updateChar(self)
		self.charDB.lastAddonVersion = currentVersion
	end
	if compareVersion(currentVersion, self.globalDB.lastAddonVersion) then
		updateGlobal(self)
		self.globalDB.lastAddonVersion = currentVersion
	end

	-- need to remove
	if type(self.config.gridToggle) == "boolean" then
		self.config.gridToggle = self.config.gridToggle and 2 or 1
	end

	-- UPDATE PET FOR PROFILE
	local curRegion = GetCurrentRegion()
	local function updatePetProfile(profile)
		if profile.oldPetForMount then
			local petForMount = profile.petForMount[curRegion]
			if not petForMount then
				petForMount = {}
				for k, v in next, profile.oldPetForMount do
					petForMount[k] = v
				end
				profile.petForMount[curRegion] = petForMount
			end
		else
			local k, v = next(profile.petForMount)
			if v ~= nil and type(v) ~= "table" then
				profile.oldPetForMount = profile.petForMount
				local petForMount = {}
				for k, v in next, profile.oldPetForMount do
					petForMount[k] = v
				end
				profile.petForMount = {[curRegion] = petForMount}
			end
		end
	end

	updatePetProfile(self.defProfile)
	for name, profile in next, self.profiles do
		updatePetProfile(profile)
	end
end