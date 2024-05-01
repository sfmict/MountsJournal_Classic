hooksecurefunc("HandleModifiedItemClick", function(link)
	local mounts = MountsJournal
	local config = mounts.config

	if config.openHyperlinks and not config.useDefaultJournal and not InCombatLockdown() and IsModifiedClick("DRESSUP") and not IsModifiedClick("CHATLINK") then
		local _,_,_, linkType, linkID = (":|H"):split(link)

		local mountID
		if linkType == "item" then
			mountID = C_MountJournal.GetMountFromItem(tonumber(linkID))
		elseif linkType == "spell" then
			linkID = tonumber(linkID)
			mountID = mounts.additionalMounts[linkID] or C_MountJournal.GetMountFromSpell(linkID)
		end

		if mountID then
			HideUIPanel(DressUpFrame)
			if not IsAddOnLoaded("Blizzard_Collections") then
				LoadAddOn("Blizzard_Collections")
			end
			ShowUIPanel(CollectionsJournal)
			MountsJournalFrame:setSelectedMount(mountID)
		end
	end
end)

-- FIX BLIZZ ERROR
if not DressUpModel then
	DressUpModel = DressUpModelFrame
end