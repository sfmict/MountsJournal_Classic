local _, L = ...
local util = MountsJournalUtil
local petRandomIcon = "Interface/AddOns/MountsJournal/textures/INV_Pet_Achievement_CaptureAPetFromEachFamily_Battle" -- select(3, GetSpellInfo(243819))


MJSetPetMixin = util.createFromEventsMixin()


function MJSetPetMixin:onLoad()
	self.mounts = MountsJournal
	self.journal = MountsJournalFrame

	self:SetScript("OnEnter", function(self)
		self.highlight:Show()
		GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
		GameTooltip:SetText(L["Summonable Battle Pet"])
		local description
		if self.id then
			if type(self.id) == "number" then
				description = self.name
			else
				description = L["Summon Random Battle Pet"]
			end
		else
			description = L["No Battle Pet"]
		end
		GameTooltip:AddLine(description, 1, 1, 1)
		GameTooltip:Show()
	end)
	self:SetScript("OnLeave", function(self)
		self.highlight:Hide()
		GameTooltip:Hide()
	end)
end


function MJSetPetMixin:onEvent(event, ...) self[event](self, ...) end


function MJSetPetMixin:onShow()
	self:SetScript("OnShow", nil)
	C_Timer.After(0, function()
		self:SetScript("OnShow", self.refresh)
		self:refresh()
		self:on("MOUNT_SELECT", self.refresh)
		self:on("UPDATE_PROFILE", self.refresh)
	end)
end


function MJSetPetMixin:onClick()
	if not self.petSelectionList then
		self.petSelectionList = CreateFrame("FRAME", nil, self, "MJCompanionsPanel")
	end
	self.petSelectionList:SetShown(not self.petSelectionList:IsShown())
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
end


function MJSetPetMixin:refresh()
	local spellID = self.journal.selectedSpellID
	local petID = self.journal.petForMount[spellID]
	self.id = petID

	if not petID then
		self.infoFrame:Hide()
	elseif type(petID) == "number" then
		local name, _, icon = GetSpellInfo(petID)

		self.name = name
		self.infoFrame.icon:SetTexture(icon)
		self.infoFrame:Show()
	else
		self.infoFrame.icon:SetTexture(petRandomIcon)
		self.infoFrame:Show()
	end
end


MJCompanionsPanelMixin = util.createFromEventsMixin()


function MJCompanionsPanelMixin:onEvent(event, ...) self[event](self, ...) end


function MJCompanionsPanelMixin:onLoad()
	self.util = MountsJournalUtil
	self.journal = MountsJournalFrame

	self:SetWidth(250)
	self:SetPoint("TOPLEFT", self.journal.bgFrame, "TOPRIGHT")
	self:SetPoint("BOTTOMLEFT", self.journal.bgFrame, "BOTTOMRIGHT")

	self.randomPet.infoFrame.icon:SetTexture(petRandomIcon)
	self.randomPet.name:SetWidth(180)
	self.randomPet.name:SetText(L["Summon Random Battle Pet"])
	self.noPet.infoFrame.icon:SetTexture("Interface/PaperDoll/UI-Backpack-EmptySlot")
	self.noPet.name:SetWidth(180)
	self.noPet.name:SetText(L["No Battle Pet"])

	self.petFiltredList = {}

	self.searchBox:SetScript("OnTextChanged", function(searchBox)
		SearchBoxTemplate_OnTextChanged(searchBox)
		self:updateFilters()
	end)

	self.listScroll.update = function() self:refresh() end
	self.listScroll.scrollBar.doNotHide = true
	HybridScrollFrame_CreateButtons(self.listScroll, "MJPetListButton")

	self:on("MOUNT_SELECT", self.Hide)
end


function MJCompanionsPanelMixin:onShow()
	self:SetScript("OnShow", nil)
	C_Timer.After(0, function()
		self:SetScript("OnShow", function(self)
			self:refresh()
			self:scrollToSelectedPet()
			self:on("UPDATE_PROFILE", self.refresh)
		end)
		self:scrollToSelectedPet()
		self:on("UPDATE_PROFILE", self.refresh)
	end)
end


function MJCompanionsPanelMixin:onHide()
	self:off("UPDATE_PROFILE", self.refresh)
	self:Hide()
end


function MJCompanionsPanelMixin:scrollToSelectedPet()
	local selectedPetID = self.journal.petForMount[self.journal.selectedSpellID]
	if type(selectedPetID) ~= "string" then return end
	local scrollFrame = self.listScroll

	for i = 1, #self.petFiltredList do
		local critterIndex = self.petFiltredList[i]
		local creatureID, name, creatureSpellID = GetCompanionInfo("CRITTER", critterIndex)
		if selectedPetID == creatureSpellID then
			local curHeight = scrollFrame.scrollBar:GetValue()
			local maxHeight = i * scrollFrame.buttonHeight
			local minHeight = maxHeight - math.floor(scrollFrame:GetHeight() + .5)

			if curHeight < minHeight then
				scrollFrame.scrollBar:SetValue(minHeight)
			elseif curHeight >= maxHeight then
				scrollFrame.scrollBar:SetValue(maxHeight - scrollFrame.buttonHeight)
			end
			break
		end
	end
end


function MJCompanionsPanelMixin:selectButtonClick(id)
	self.journal.petForMount[self.journal.selectedSpellID] = id
	self.journal:updateMountsList()
	self:GetParent():refresh()
	self:Hide()
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
end


function MJCompanionsPanelMixin:refresh()
	local scrollFrame = self.listScroll
	local offset = HybridScrollFrame_GetOffset(scrollFrame)
	local numPets = #self.petFiltredList
	local selectedPetID = self.journal.petForMount[self.journal.selectedSpellID]

	for i, btn in ipairs(scrollFrame.buttons) do
		local index = i + offset

		if index <= numPets then
			local critterIndex = self.petFiltredList[index]
			local creatureID, name, creatureSpellID, icon, isSummoned = GetCompanionInfo("CRITTER", critterIndex)

			btn.id = creatureSpellID
			btn.creatureID = creatureID
			btn.selectedTexture:SetShown(creatureSpellID == selectedPetID)
			btn.name:SetText(name)
			btn.infoFrame.icon:SetTexture(icon)

			if btn.showingTooltip then
				btn:GetScript("OnEnter")(btn)
			end

			btn:Show()
		else
			btn:Hide()
		end
	end

	HybridScrollFrame_Update(scrollFrame, scrollFrame.buttonHeight * numPets, scrollFrame:GetHeight())
end


function MJCompanionsPanelMixin:updateFilters()
	local text = self.util.cleanText(self.searchBox:GetText())

	wipe(self.petFiltredList)
	for i = 1, GetNumCompanions("CRITTER") do
		local _, name = GetCompanionInfo("CRITTER", i)

		if #text == 0
		or name:lower():find(text, 1, true)
		then
			self.petFiltredList[#self.petFiltredList + 1] = i
		end
	end

	self:refresh()
end