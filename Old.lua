local addon = ...
local mounts = MountsJournal


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


local function after(self, func)
	self.after = self.after or {}
	self.after[#self.after + 1] = func
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

		after(self, function()
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
		end)
	end

	-- IF < 4.4.4 GLOBAL
	if compareVersion("4.4.4", self.globalDB.lastAddonVersion) then
		if self.filters.family then wipe(self.filters.family) end
		if self.defFilters.family then wipe(self.defFilters.family) end
	end
end


function mounts:setOldChanges()
	self.setOldChanges = nil

	local currentVersion = C_AddOns.GetAddOnMetadata(addon, "Version")
	--@do-not-package@
	if currentVersion == "@project-version@" then currentVersion = "4.4.4" end
	--@end-do-not-package@

	if compareVersion(currentVersion, self.globalDB.lastAddonVersion) then
		updateGlobal(self)
		self.globalDB.lastAddonVersion = currentVersion
	end
end