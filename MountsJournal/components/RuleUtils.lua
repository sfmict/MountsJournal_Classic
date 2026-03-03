local _, ns = ...
local macroFrame, util = ns.macroFrame, ns.util
local C_Spell, C_Item, GetRealZoneText, GetSubZoneText, GetZoneText, GetMinimapZoneText, C_TransmogCollection, C_Minimap, C_EquipmentSet, GetNumGroupMembers, GetNumSubgroupMembers, UnitGUID, UnitIsConnected, IsInGroup, BNGetNumFriends, C_BattleNet = C_Spell, C_Item, GetRealZoneText, GetSubZoneText, GetZoneText, GetMinimapZoneText, C_TransmogCollection, C_Minimap, C_EquipmentSet, GetNumGroupMembers, GetNumSubgroupMembers, UnitGUID, UnitIsConnected, IsInGroup, BNGetNumFriends, C_BattleNet


function macroFrame:isSpellReady(spellID)
	local cdInfo = C_Spell.GetSpellCooldown(spellID)
	return cdInfo and cdInfo.startTime == 0
end


function macroFrame:hasPlayerBuff(spellID)
	return util.checkAura("player", spellID, "HELPFUL")
end


function macroFrame:hasPlayerDebuff(spellID)
	return util.checkAura("player", spellID, "HARMFUL")
end


function macroFrame:zoneMatch(zoneText)
	local cz = ("/%s/%s/%s/%s/"):format(GetRealZoneText(), GetSubZoneText(), GetZoneText(), GetMinimapZoneText()):gsub("//", "/")
	return cz:match(zoneText) and true
end


function macroFrame:checkMap(mapID)
	local mapList = self.mounts.mapList
	for i = 1, #mapList do
		if mapList[i] == mapID then return true end
	end
	return false
end


do
	local noTransmogID = Constants.Transmog.NoTransmogID
	local model = CreateFrame("DressUpModel")
	model:Hide()
	model:SetUnit("player", false, true, false, true)

	local function isOutfitEquipped(outfitID)
		local outfitItemTransmogInfoList = C_TransmogCollection.GetOutfitItemTransmogInfoList(outfitID)
		if not outfitItemTransmogInfoList then return end

		model:Show()
		local currentItemTransmogInfoList = model:GetItemTransmogInfoList()
		model:Hide()
		if not currentItemTransmogInfoList then return end

		for slotID = 1, #outfitItemTransmogInfoList do
			local itemTransmogInfo = outfitItemTransmogInfoList[slotID]
			if itemTransmogInfo.appearanceID ~= noTransmogID and not itemTransmogInfo:IsEqual(currentItemTransmogInfoList[slotID]) then
				return
			end
		end
		return true
	end

	function macroFrame:isTtransmogOutfitActive(name)
		local outfints = C_TransmogCollection.GetOutfits()
		for i = 1, #outfints do
			local id = outfints[i]
			if name == C_TransmogCollection.GetOutfitInfo(id) then
				return isOutfitEquipped(id)
			end
		end
		return false
	end

	function macroFrame:anyTtransmogOutfitActive(values)
		local outfints = C_TransmogCollection.GetOutfits()
		for i = 1, #outfints do
			local id = outfints[i]
			if values[C_TransmogCollection.GetOutfitInfo(id)] and isOutfitEquipped(id) then
				return true
			end
		end
		return false
	end
end


function macroFrame:checkTracking(key, value)
	for i = 1, C_Minimap.GetNumTrackingTypes() do
		local trackingInfo = C_Minimap.GetTrackingInfo(i)
		if trackingInfo[key] == value then
			return trackingInfo.active
		end
	end
	return false
end


function macroFrame:checkEquipmentSet(setID)
	local _,_,_, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(setID)
	return isEquipped
end


function macroFrame:checkEquipmentSets(setIDs)
	for i = 1, #setIDs do
		local _,_,_, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(setIDs[i])
		if isEquipped then return true end
	end
	return false
end


function macroFrame:isMapFlagActive(flag, profileName)
	local profile = profileName == "" and self.mounts.defProfile or self.mounts.profiles[profileName]
	if profile then
		local mapList = self.mounts.mapList
		for i = 1, #mapList do
			local list = profile.zoneMounts[mapList[i]]
			if list and list.flags.enableFlags then return list.flags[flag] end
		end
	end
	return false
end


function macroFrame:isItemEquipped(item)
	if C_Item.IsEquippedItem(item)
	or C_Item.IsEquippedItemType(item)
	then
		return true
	end
	return false
end


function macroFrame:isUnitInGroup(guid, isRaid)
	local unit, uGuid
	if isRaid then
		for i = 1, GetNumGroupMembers() do
			unit = "raid"..i
			uGuid = UnitGUID(unit)
			if not (util.isMidnight and issecretvalue(uGuid)) and guid == UnitGUID(unit) then
				return UnitIsConnected(unit)
			end
		end
	else
		for i = 1, GetNumSubgroupMembers() do
			unit = "party"..i
			uGuid = UnitGUID(unit)
			if not (util.isMidnight and issecretvalue(uGuid)) and guid == UnitGUID(unit) then
				return UnitIsConnected(unit)
			end
		end
	end
	return false
end


do
	local function checkApps(self, i, isRaid)
		for j = 1, C_BattleNet.GetFriendNumGameAccounts(i) do
			local gameAccountInfo = C_BattleNet.GetFriendGameAccountInfo(i, j)
			if gameAccountInfo.clientProgram == "WoW" and self:isUnitInGroup(gameAccountInfo.playerGuid, isRaid) then
				return true
			end
		end
		return false
	end

	function macroFrame:isFriendInGroup(btag, isRaid)
		if not IsInGroup() or isRaid and not IsInRaid() then return end
		local _, numOline, fNum, fNumOnline = BNGetNumFriends()
		for i = 1, fNumOnline do
			local accountInfo = C_BattleNet.GetFriendAccountInfo(i)
			if accountInfo.battleTag == btag then
				return checkApps(self, i, isRaid)
			end
		end
		for i = fNum + 1, fNum + numOline - fNumOnline do
			local accountInfo = C_BattleNet.GetFriendAccountInfo(i)
			if accountInfo.battleTag == btag then
				return checkApps(self, i, isRaid)
			end
		end
		return false
	end
end


function macroFrame:hasProfession(values)
	local profs = self.mounts.profs
	for i = 1, #values do
		if profs[values[i]] then return true end
	end
	return false
end


function macroFrame:anyHoldayActive(values)
	for i = 1, #values do
		if self.calendar:isHolidayActive(values[i]) then return true end
	end
	return false
end
