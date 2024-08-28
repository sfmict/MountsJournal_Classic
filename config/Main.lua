local addon, ns = ...
local L, util, mounts, binding = ns.L, ns.util, ns.mounts, ns.binding
local specificDB = ns.specificDB
local config = CreateFrame("FRAME", "MountsJournalConfig")
ns.config = config
config:Hide()
config.macroName = "MJMacro"
config.secondMacroName = "MJSecondMacro"


-- BIND MOUNT
mounts:on("ADDON_INIT", function(self)
	config.bindSummon1 = binding:createButtonBinding(util.secureButtonNameMount, ("%s %s %d"):format(addon, SUMMONS, 1), "MJSecureActionButtonTemplate")
	config.bindSummon1.secure.id = 1

	config.bindSummon2 = binding:createButtonBinding(util.secureButtonNameSecondMount, ("%s %s %d"):format(addon, SUMMONS, 2), "MJSecureActionButtonTemplate")
	config.bindSummon2.secure.id = 2
	config.bindSummon2.secure.forceModifier = true
end)


-- SHOW CONFIG
config:SetScript("OnShow", function(self)
	StaticPopupDialogs[util.addonName.."MACRO_EXISTS"] = {
		text = addon..": "..L["A macro named \"%s\" already exists, overwrite it?"],
		button1 = ACCEPT,
		button2 = CANCEL,
		hideOnEscape = 1,
		whileDead = 1,
		OnAccept = function(popup, cb) popup:Hide() cb() end,
	}

	local randomMountIcon = 413588

	-- ENABLE APPLY
	local function enableBtns()
		self.applyBtn:Enable()
		self.cancelBtn:Enable()
	end

	-- TOOLTIP
	local function setTooltip(frame, anchor, title, text)
		frame:SetScript("OnEnter", function()
			GameTooltip:SetOwner(frame, anchor)
			GameTooltip:SetText(title)
			GameTooltip:AddLine(text, 1, 1, 1, 1, true)
			GameTooltip:Show()
		end)

		frame:SetScript("OnLeave", function()
			GameTooltip_Hide()
		end)
	end

	-- GROUP
	local function createGropPanel(parent, numCheck, numComboBox)
		local group = CreateFrame("FRAME", nil, parent, "MJOptionsPanel")
		group:SetPoint("RIGHT", parent:GetParent(), 0, 0)
		-- check = 26 + 3, combobox = 24 + 8 + 1
		group:SetHeight(29 * numCheck + 33 * (numComboBox or 0) + 3)
		return group
	end

	-- VERSION
	local ver = self:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	ver:SetPoint("TOPRIGHT", -40, 15)
	ver:SetTextColor(.5, .5, .5, 1)
	ver:SetJustifyH("RIGHT")
	ver:SetText(C_AddOns.GetAddOnMetadata(addon, "Version"))

	-- TITLE
	local subtitle = self:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	subtitle:SetHeight(30)
	subtitle:SetPoint("TOPLEFT", 16, -16)
	subtitle:SetNonSpaceWrap(true)
	subtitle:SetJustifyH("LEFT")
	subtitle:SetJustifyV("TOP")
	subtitle:SetText(L["ConfigPanelTitle"])

	-- LEFT PANEL
	self.leftPanel = CreateFrame("FRAME", nil, self, "MJOptionsPanel")
	self.leftPanel:SetPoint("TOPLEFT", self, 8, -37)
	self.leftPanel:SetPoint("BOTTOMRIGHT", self, "BOTTOMLEFT", 300, 32)

	-- WATER JUMP
	self.waterJump = CreateFrame("CheckButton", nil, self.leftPanel, "MJCheckButtonTemplate")
	self.waterJump:SetPoint("TOPLEFT", self.leftPanel, 13, -15)
	self.waterJump.Text:SetText(L["Handle a jump in water"])
	self.waterJump.tooltipText = L["Handle a jump in water"]
	self.waterJump.tooltipRequirement = L["WaterJumpDescription"]
	self.waterJump:HookScript("OnClick", enableBtns)

	-- SUMMON 1
	local summon1 = self.leftPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	summon1:SetPoint("TOPLEFT", self.waterJump, "BOTTOMLEFT", 0, -20)
	summon1:SetText(SUMMON.." 1")

	-- CREATE MACRO
	self.createMacroBtn = CreateFrame("BUTTON", nil, self.leftPanel, "UIPanelButtonTemplate")
	self.createMacroBtn:SetSize(258, 30)
	self.createMacroBtn:SetPoint("TOPLEFT", summon1, "BOTTOMLEFT", 0, -5)
	self.createMacroBtn:SetText(L["CreateMacro"])
	self.createMacroBtn:SetScript("OnClick", function() self:createMacro(self.macroName, self.secureButtonNameMount, 303868, true) end)

	setTooltip(self.createMacroBtn, "ANCHOR_TOP", L["CreateMacro"], L["CreateMacroTooltip"])

	-- OR TEXT
	local macroOrBind = self.leftPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	macroOrBind:SetPoint("TOP", self.createMacroBtn, "BOTTOM", 0, -3)
	macroOrBind:SetText(L["or key bind"])

	-- BIND MOUNT 1
	self.bindSummon1:SetParent(self.leftPanel)
	self.bindSummon1:SetSize(258, 22)
	self.bindSummon1:SetPoint("TOPLEFT", self.createMacroBtn, "BOTTOMLEFT", 0, -20)

	-- HELP PLATE SECOND MOUNT
	local helpPlateSecond = CreateFrame("FRAME", nil, self.leftPanel, "MJHelpPlate")
	helpPlateSecond:SetPoint("TOP", self.bindSummon1, "BOTTOM", 0, -10)
	helpPlateSecond.tooltip = L["SecondMountTooltipTitle"]:format(SUMMONS)
	helpPlateSecond.tooltipDescription = "\n"..L["SecondMountTooltipDescription"]

	-- MODIFIER TEXT
	local modifierText = self.leftPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	modifierText:SetPoint("TOPLEFT", self.bindSummon1, "BOTTOMLEFT", 0, -80)
	modifierText:SetText(L["Modifier"]..":")

	-- MODIFIER COMBOBOX
	local modifierCombobox = LibStub("LibSFDropDown-1.5"):CreateButton(self.leftPanel)
	self.modifierCombobox = modifierCombobox
	modifierCombobox:SetPoint("LEFT", modifierText, "RIGHT", 7, 0)
	modifierCombobox:ddSetInitFunc(function(self, level)
		local info = {}
		for i, modifier in ipairs({"ALT", "CTRL", "SHIFT", "NONE"}) do
			info.text = _G[modifier.."_KEY"]
			info.value = modifier
			info.checked = function(btn) return modifierCombobox:ddGetSelectedValue() == btn.value end
			info.func = function(btn)
				self:ddSetSelectedValue(btn.value)
				enableBtns()
			end
			self:ddAddButton(info, level)
		end
	end)

	-- SUMMON 2
	local summon2 = self.leftPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	summon2:SetPoint("TOPLEFT", modifierText, "BOTTOMLEFT", 0, -20)
	summon2:SetText(SUMMON.." 2")

	-- CREATE SECOND MACRO
	self.createSecondMacroBtn = CreateFrame("BUTTON", nil, self.leftPanel, "UIPanelButtonTemplate")
	self.createSecondMacroBtn:SetSize(258, 30)
	self.createSecondMacroBtn:SetPoint("TOPLEFT", summon2, "BOTTOMLEFT", 0, -5)
	self.createSecondMacroBtn:SetText(L["CreateMacro"])
	self.createSecondMacroBtn:SetScript("OnClick", function() self:createMacro(self.secondMacroName, self.secureButtonNameSecondMount, 237534, true) end)

	setTooltip(self.createSecondMacroBtn, "ANCHOR_TOP", L["CreateMacro"], L["CreateMacroTooltip"])

	-- OR TEXT SECOND
	local macroOrBindSecond = self.leftPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	macroOrBindSecond:SetPoint("TOP", self.createSecondMacroBtn, "BOTTOM", 0, -3)
	macroOrBindSecond:SetText(L["or key bind"])

	-- BIND MOUNT 2
	self.bindSummon2:SetParent(self.leftPanel)
	self.bindSummon2:SetSize(258, 22)
	self.bindSummon2:SetPoint("TOPLEFT", self.createSecondMacroBtn, "BOTTOMLEFT", 0, -20)

	-- UNBOUND MESSAGE
	binding.unboundMessage:SetParent(self)
	binding.unboundMessage:SetSize(500, 10)
	binding.unboundMessage:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 14, 14)

	-- RIGHT PANEL
	self.rightPanel = CreateFrame("FRAME", nil, self, "MJOptionsPanel")
	self.rightPanel:SetPoint("TOPLEFT", self.leftPanel, "TOPRIGHT", 4, 0)
	self.rightPanel:SetPoint("BOTTOMRIGHT", self, -8, 32)

	self.rightPanelScroll = CreateFrame("ScrollFrame", nil, self.rightPanel, "MJPanelScrollFrameTemplate")
	self.rightPanelScroll:SetPoint("TOPLEFT", self.rightPanel, 4, -6)
	self.rightPanelScroll:SetPoint("BOTTOMRIGHT", self.rightPanel, -26, 5)

	-- MINIMAP GROUP
	self.minimapGroup = createGropPanel(self.rightPanelScroll.child, 2)
	self.minimapGroup:SetPoint("TOPLEFT", 3, -2)

	-- SHOW MINIMAP BUTTON
	self.showMinimapButton = CreateFrame("CheckButton", nil, self.minimapGroup, "MJCheckButtonTemplate")
	self.showMinimapButton:SetPoint("TOPLEFT", self.minimapGroup, 3, -3)
	self.showMinimapButton.Text:SetText(L["Show Minimap Button"])
	self.showMinimapButton:HookScript("OnClick", enableBtns)

	-- LOCK MINIMAP BUTTON
	self.lockMinimapButton = util.createCheckboxChild(L["Lock Minimap Button"], self.showMinimapButton)
	self.lockMinimapButton:HookScript("OnClick", enableBtns)

	-- REPAIR GROUP
	self.repairGroup = createGropPanel(self.rightPanelScroll.child, 3, 1)
	self.repairGroup:SetPoint("TOPLEFT", self.minimapGroup, "BOTTOMLEFT", 0, -5)

	-- USE REPAIR MOUNTS
	self.useRepairMounts = CreateFrame("CheckButton", nil, self.repairGroup, "MJCheckButtonTemplate")
	self.useRepairMounts:SetPoint("TOPLEFT", self.repairGroup, 3, -3)
	self.useRepairMounts.Text:SetText(L["If item durability is less than"])
	self.useRepairMounts.tooltipText = L["If item durability is less than"]
	self.useRepairMounts.tooltipRequirement = L["UseRepairMountsDescription"]
	self.useRepairMounts:HookScript("OnClick", enableBtns)

	-- editbox
	self.repairPercent = CreateFrame("Editbox", nil, self.repairGroup, "MJNumberTextBox")
	self.repairPercent:SetPoint("LEFT", self.useRepairMounts.Text, "RIGHT", 3, 0)
	self.repairPercent:SetScript("OnTextChanged", function(editBox, userInput)
		if userInput then
			local value = tonumber(editBox:GetText()) or 0
			if value < 0 then
				editBox:SetNumber(0)
			elseif value > 100 then
				editBox:SetNumber(100)
			end
			enableBtns()
		end
	end)
	self.repairPercent:SetScript("OnMouseWheel", function(editBox, delta)
		if editBox:IsEnabled() then
			local value = (tonumber(editBox:GetText()) or 0) + (delta > 0 and 1 or -1)
			if value >= 0 and value <= 100 then
				editBox:SetNumber(value)
				enableBtns()
			end
		end
	end)
	util.setCheckboxChild(self.useRepairMounts, self.repairPercent)

	-- text
	self.repairPercentText = self.repairPercent:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	self.repairPercentText:SetPoint("LEFT", self.repairPercent, "RIGHT", 3, 0)
	self.repairPercentText:SetText("%")

	-- USE REPAIR MOUNTS IN FLYABLE ZONES
	self.repairFlyable = util.createCheckboxChild(L["In flyable zones"], self.useRepairMounts)
	self.repairFlyable.tooltipText = L["In flyable zones"]
	self.repairFlyable.tooltipRequirement = L["UseRepairMountsDescription"]
	self.repairFlyable.setEnabledFunc = function(btn)
		self.repairFlyablePercentText:SetTextColor(btn.Text:GetTextColor())
	end
	self.repairFlyable:HookScript("OnEnable", self.repairFlyable.setEnabledFunc)
	self.repairFlyable:HookScript("OnDisable", self.repairFlyable.setEnabledFunc)
	self.repairFlyable:HookScript("OnClick", enableBtns)

	-- editbox
	self.repairFlyablePercent = CreateFrame("Editbox", nil, self.repairGroup, "MJNumberTextBox")
	self.repairFlyablePercent:SetPoint("LEFT", self.repairFlyable.Text, "RIGHT", 3, 0)
	self.repairFlyablePercent:SetScript("OnTextChanged", function(editBox, userInput)
		if userInput then
			local value = tonumber(editBox:GetText()) or 0
			if value < 0 then
				editBox:SetNumber(0)
			elseif value > 100 then
				editBox:SetNumber(100)
			end
			enableBtns()
		end
	end)
	self.repairFlyablePercent:SetScript("OnMouseWheel", function(editBox, delta)
		if editBox:IsEnabled() then
			local value = (tonumber(editBox:GetText()) or 0) + (delta > 0 and 1 or -1)
			if value >= 0 and value <= 100 then
				editBox:SetNumber(value)
				enableBtns()
			end
		end
	end)
	util.setCheckboxChild(self.repairFlyable, self.repairFlyablePercent)

	-- text
	self.repairFlyablePercentText = self.repairPercent:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	self.repairFlyablePercentText:SetPoint("LEFT", self.repairFlyablePercent, "RIGHT", 3, 0)
	self.repairFlyablePercentText:SetText("%")

	-- FREE SLOTS NUM
	self.freeSlots = CreateFrame("CheckButton", nil, self.repairGroup, "MJCheckButtonTemplate")
	self.freeSlots:SetPoint("TOPLEFT", self.repairFlyable, "BOTTOMLEFT", -20, -3)
	-- self.freeSlots.Text:SetPoint("RIGHT", self.repairGroup, -37, 0) -- width isn't redered correctly
	self.freeSlots.Text:SetWidth(264)
	self.freeSlots.Text:SetText(L["If the number of free slots in bags is less"])
	self.freeSlots:HookScript("OnClick",  enableBtns)

	-- editbox
	self.freeSlotsNum = CreateFrame("Editbox", nil, self.repairGroup, "MJNumberTextBox")
	self.freeSlotsNum:SetPoint("LEFT", self.freeSlots.Text, self.freeSlots.Text:GetWrappedWidth() + 3, 0)
	self.freeSlotsNum:SetScript("OnTextChanged", function(editBox, userInput)
		if userInput then
			local value = tonumber(editBox:GetText()) or 0
			if value < 1 then editBox:SetNumber(1) end
			enableBtns()
		end
	end)
	self.freeSlotsNum:SetScript("OnMouseWheel", function(editBox, delta)
		if editBox:IsEnabled() then
			local value = (tonumber(editBox:GetText()) or 0) + (delta > 0 and 1 or -1)
			if value > 0 then
				editBox:SetNumber(value)
				enableBtns()
			end
		end
	end)
	util.setCheckboxChild(self.freeSlots, self.freeSlotsNum)

	-- REPAIR MOUNTS COMBOBOX
	self.repairMountsCombobox = LibStub("LibSFDropDown-1.5"):CreateButton(self.repairGroup, 230)
	self.repairMountsCombobox:SetPoint("TOPLEFT", self.freeSlots, "BOTTOMLEFT", 0, -8)
	self.repairMountsCombobox:ddSetInitFunc(function(self, level)
		local info = {}

		info.tooltipWhileDisabled = true
		for spellID in pairs(specificDB.repair) do
			local mountID = C_MountJournal.GetMountFromSpell(spellID)
			local name, _, icon, _,_,_,_,_,_, shouldHideOnChar, isCollected = C_MountJournal.GetMountInfoByID(mountID)

			if not shouldHideOnChar then
				info.text = name
				info.icon = icon
				info.value = spellID
				info.disabled = not isCollected
				info.checked = function(btn) return self:ddGetSelectedValue() == btn.value end
				info.func = function(btn)
					self:ddSetSelectedValue(btn.value)
					enableBtns()
				end
				info.OnTooltipShow = function(btn, tooltip)
					tooltip:SetHyperlink("spell:"..spellID)
				end
				self:ddAddButton(info, level)
			end
		end
	end)

	-- USE MAGIC BROOM
	self.useMagicBroom = CreateFrame("CheckButton", nil, self.rightPanelScroll.child, "MJCheckButtonTemplate")
	self.useMagicBroom:SetPoint("TOPLEFT", self.repairMountsCombobox, "BOTTOMLEFT", 0, -15)
	local magicBroom = Item:CreateFromItemID(37011)
	if magicBroom:IsItemDataCached() then
		self.useMagicBroom.Text:SetText(L["Use %s"]:format(magicBroom:GetItemLink()))
	else
		magicBroom:ContinueOnItemLoad(function()
			self.useMagicBroom.Text:SetText(L["Use %s"]:format(magicBroom:GetItemLink()))

		self.useUnderlightAngler = CreateFrame("CheckButton", nil, self.underlightAnglerGroup, "MJCheckButtonTemplate")
		self.useUnderlightAngler:SetPoint("TOPLEFT", self.underlightAnglerGroup, 3, -3)
		end)
	end
	util.setHyperlinkTooltip(self.useMagicBroom)
	self.useMagicBroom.tooltipText = L["UseMagicBroomTitle"]
	self.useMagicBroom.tooltipRequirement = L["UseMagicBroomDescription"]
	self.useMagicBroom:HookScript("OnClick", enableBtns)

	self.petGroup = createGropPanel(self.rightPanelScroll.child, 4)
	self.petGroup:SetPoint("TOPLEFT", self.useMagicBroom, "BOTTOMLEFT", -3, -12)

	-- SUMMON PET EVERY N MINUTES
	self.summonPetEvery = CreateFrame("CheckButton", nil, self.petGroup, "MJCheckButtonTemplate")
	self.summonPetEvery:SetPoint("TOPLEFT", self.petGroup, 3, -3)
	self.summonPetEvery.Text:SetText(L["Summon a pet every"])
	self.summonPetEvery:HookScript("OnClick",  enableBtns)

	-- count
	self.summonPetEveryN = CreateFrame("Editbox", nil, self.petGroup, "MJNumberTextBox")
	self.summonPetEveryN:SetPoint("LEFT", self.summonPetEvery.Text, "RIGHT", 3, 0)
	self.summonPetEveryN:SetScript("OnTextChanged", function(editBox, userInput)
		if userInput then
			local value = tonumber(editBox:GetText()) or 0
			if value < 1 then
				editBox:SetNumber(1)
			elseif value > 999 then
				editBox:SetNumber(999)
			end
			enableBtns()
		end
	end)
	self.summonPetEveryN:SetScript("OnMouseWheel", function(editBox, delta)
		if editBox:IsEnabled() then
			local value = (tonumber(editBox:GetText()) or 0) + (delta > 0 and 1 or -1)
			if value >= 1 and value <= 999 then
				editBox:SetNumber(value)
				enableBtns()
			end
		end
	end)
	util.setCheckboxChild(self.summonPetEvery, self.summonPetEveryN)

	-- minutes
	self.summonPetMinutes = self.summonPetEveryN:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	self.summonPetMinutes:SetPoint("LEFT", self.summonPetEveryN, "RIGHT", 3, 0)
	self.summonPetMinutes:SetText(L["min"])

	-- SUMMON ONLY FAVORITES
	self.summonPetOnlyFavorites = util.createCheckboxChild(L["Summon only favorites"], self.summonPetEvery)
	self.summonPetOnlyFavorites.checkFunc = function() return mounts.config.summonPetOnlyFavorites end
	self.summonPetOnlyFavorites:HookScript("OnClick", enableBtns)

	-- NO PET IN RAID
	self.noPetInRaid = CreateFrame("CheckButton", nil, self.petGroup, "MJCheckButtonTemplate")
	self.noPetInRaid:SetPoint("TOPLEFT", self.summonPetOnlyFavorites, "BOTTOMLEFT", -20, -3)
	self.noPetInRaid.Text:SetSize(245, 25)
	self.noPetInRaid.Text:SetText(L["NoPetInRaid"])
	self.noPetInRaid:HookScript("OnClick", enableBtns)

	-- NO PET IN GROUP
	self.noPetInGroup = CreateFrame("CheckButton", nil, self.petGroup, "MJCheckButtonTemplate")
	self.noPetInGroup:SetPoint("TOPLEFT", self.noPetInRaid, "BOTTOMLEFT", 0, -3)
	self.noPetInGroup.Text:SetSize(245, 25)
	self.noPetInGroup.Text:SetText(L["NoPetInGroup"])
	self.noPetInGroup:HookScript("OnClick", enableBtns)

	-- COPY MOUNT TARGET
	self.copyMountTarget = CreateFrame("CheckButton", nil, self.rightPanelScroll.child, "MJCheckButtonTemplate")
	self.copyMountTarget:SetPoint("TOPLEFT", self.noPetInGroup, "BOTTOMLEFT", 0, -15)
	self.copyMountTarget.Text:SetSize(245, 25)
	self.copyMountTarget.Text:SetText(L["CopyMountTarget"])
	self.copyMountTarget:HookScript("OnClick", enableBtns)

	-- ARROW BUTTONS
	self.arrowButtons = CreateFrame("CheckButton", nil, self.rightPanelScroll.child, "MJCheckButtonTemplate")
	self.arrowButtons:SetPoint("TOPLEFT", self.copyMountTarget, "BOTTOMLEFT", 0, -15)
	self.arrowButtons.Text:SetSize(245, 25)
	self.arrowButtons.Text:SetText(L["Enable arrow buttons to browse mounts"])
	self.arrowButtons:HookScript("OnClick", enableBtns)

	-- OPEN HYPERLINKS
	self.openLinks = CreateFrame("CheckButton", nil, self.rightPanelScroll.child, "MJCheckButtonTemplate")
	self.openLinks:SetPoint("TOPLEFT", self.arrowButtons, "BOTTOMLEFT", 0, -15)
	self.openLinks.Text:SetSize(245, 25)
	self.openLinks.Text:SetText(L["Open links in %s"]:format(addon))
	self.openLinks.tooltipText = L["Open links in %s"]:format(addon)
	local dressUpMod = ("-"):split(GetModifiedClick("DRESSUP"))
	local chatLinkMod = ("-"):split(GetModifiedClick("CHATLINK"))
	self.openLinks.tooltipRequirement = ("%s+%s %s\n%s+%s+%s %s"):format(dressUpMod, L["Click opens in"], addon, dressUpMod, chatLinkMod, L["Click opens in"], DRESSUP_FRAME)
	self.openLinks:HookScript("OnClick", enableBtns)

	-- WOWHEAD LINK SHOW
	self.showWowheadLink = CreateFrame("CheckButton", nil, self.rightPanelScroll.child, "MJCheckButtonTemplate")
	self.showWowheadLink:SetPoint("TOPLEFT", self.openLinks, "BOTTOMLEFT", 0, -15)
	self.showWowheadLink.Text:SetPoint("RIGHT", self.rightPanelScroll)
	self.showWowheadLink.Text:SetText(L["Show wowhead link in mount preview"])
	self.showWowheadLink:HookScript("OnClick", enableBtns)

		-- CANCEL
	self.cancelBtn = CreateFrame("BUTTON", nil, self, "UIPanelButtonTemplate")
	self.cancelBtn:SetSize(96, 22)
	self.cancelBtn:Disable()
	self.cancelBtn:SetPoint("BOTTOMRIGHT", -8, 8)
	self.cancelBtn:SetText(CANCEL)
	self.cancelBtn:SetScript("OnClick", function(btn)
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
		self:GetScript("OnHide")(self)
		binding:setButtonText(self.bindMount)
		binding:setButtonText(self.bindSecondMount)
		self:OnRefresh()
		self.applyBtn:Disable()
		btn:Disable()
	end)

	-- APPLY
	self.applyBtn = CreateFrame("BUTTON", nil, self, "UIPanelButtonTemplate")
	self.applyBtn:SetSize(96, 22)
	self.applyBtn:Disable()
	self.applyBtn:SetPoint("RIGHT", self.cancelBtn, "LEFT", -5, 0)
	self.applyBtn:SetText(APPLY)
	self.applyBtn:SetScript("OnClick", function(btn)
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
		self:OnCommit()
		self.cancelBtn:Disable()
		btn:Disable()
	end)

	-- UPDATE BINDING BUTTONS
	binding:on("SET_BINDING", enableBtns)

	-- REFRESH
	self.OnRefresh = function(self)
		binding.unboundMessage:Hide()
		modifierCombobox:ddSetSelectedValue(mounts.config.modifier)
		modifierCombobox:ddSetSelectedText(_G[mounts.config.modifier.."_KEY"])
		self.waterJump:SetChecked(mounts.config.waterJump)
		self.showMinimapButton:SetChecked(not mounts.config.omb.hide)
		self.lockMinimapButton:SetChecked(mounts.config.omb.lock)
		self.useRepairMounts:SetChecked(mounts.config.useRepairMounts)
		self.repairFlyable:SetChecked(mounts.config.useRepairFlyable)
		self.repairPercent:SetNumber(tonumber(mounts.config.useRepairMountsDurability) or 0)
		self.repairFlyablePercent:SetNumber(tonumber(mounts.config.useRepairFlyableDurability) or 0)
		self.freeSlots:SetChecked(mounts.config.useRepairFreeSlots)
		self.freeSlotsNum:SetNumber(tonumber(mounts.config.useRepairFreeSlotsNum) or 0)
		self.repairMountsCombobox:ddSetSelectedValue(mounts.config.repairSelectedMount)
		if mounts.config.repairSelectedMount then
			local mountID = C_MountJournal.GetMountFromSpell(mounts.config.repairSelectedMount)
			local name, _, icon = C_MountJournal.GetMountInfoByID(mountID)
			self.repairMountsCombobox:ddSetSelectedText(name, icon)
		else
			self.repairMountsCombobox:ddSetSelectedText(L["Random available mount"], randomMountIcon)
		end
		self.useMagicBroom:SetChecked(mounts.config.useMagicBroom)
		self.summonPetEvery:SetChecked(mounts.config.summonPetEvery)
		self.summonPetEveryN:SetNumber(tonumber(mounts.config.summonPetEveryN) or 1)
		for _, child in ipairs(self.summonPetEvery.childs) do
			if child.checkFunc then child:SetChecked(child:checkFunc()) end
		end
		self.noPetInRaid:SetChecked(mounts.config.noPetInRaid)
		self.noPetInGroup:SetChecked(mounts.config.noPetInGroup)
		self.copyMountTarget:SetChecked(mounts.config.copyMountTarget)
		self.arrowButtons:SetChecked(mounts.config.arrowButtonsBrowse)
		self.openLinks:SetChecked(mounts.config.openHyperlinks)
		self.showWowheadLink:SetChecked(mounts.config.showWowheadLink)
		self.cancelBtn:Disable()
		self.applyBtn:Disable()
	end
	self:OnRefresh()
	self:SetScript("OnShow", self.OnRefresh)

	-- COMMIT
	config.OnCommit = function(self)
		binding.unboundMessage:Hide()
		mounts.config.omb.hide = not self.showMinimapButton:GetChecked()
		mounts.config.useRepairMounts = self.useRepairMounts:GetChecked()
		mounts.config.useRepairMountsDurability = tonumber(self.repairPercent:GetText()) or 0
		mounts.config.useRepairFlyable = self.repairFlyable:GetChecked()
		mounts.config.useRepairFlyableDurability = tonumber(self.repairFlyablePercent:GetText()) or 0
		mounts.config.useRepairFreeSlots = self.freeSlots:GetChecked()
		mounts.config.useRepairFreeSlotsNum = tonumber(self.freeSlotsNum:GetText()) or 0
		mounts.config.repairSelectedMount = self.repairMountsCombobox:ddGetSelectedValue()
		mounts.config.useMagicBroom = self.useMagicBroom:GetChecked()
		mounts.config.summonPetEvery = self.summonPetEvery:GetChecked()
		mounts.config.summonPetEveryN = tonumber(self.summonPetEveryN:GetText()) or 1
		mounts.config.summonPetOnlyFavorites = self.summonPetOnlyFavorites:GetChecked()
		mounts.config.noPetInRaid = self.noPetInRaid:GetChecked()
		mounts.config.noPetInGroup = self.noPetInGroup:GetChecked()
		mounts.config.copyMountTarget = self.copyMountTarget:GetChecked()
		mounts.config.arrowButtonsBrowse = self.arrowButtons:GetChecked()
		mounts.config.openHyperlinks = self.openLinks:GetChecked()
		mounts.config.showWowheadLink = self.showWowheadLink:GetChecked()

		binding:saveBinding()
		mounts:setHandleWaterJump(self.waterJump:GetChecked())
		mounts:setModifier(self.modifierCombobox:ddGetSelectedValue())
		mounts:UPDATE_INVENTORY_DURABILITY()
		ns.pets:setSummonEvery()
		MountsJournalFrame:setArrowSelectMount(mounts.config.arrowButtonsBrowse)

		local ldbi = LibStub("LibDBIcon-1.0")
		if mounts.config.omb.hide then
			ldbi:Hide(addon)
		else
			ldbi:Show(addon)
		end
		if self.lockMinimapButton:GetChecked() then
			ldbi:Lock(addon)
		else
			ldbi:Unlock(addon)
		end
	end
end)


function config:createMacro(macroName, buttonName, texture, openMacroFrame, overwrite)
	if InCombatLockdown() then return end
	local _, ctexture = GetMacroInfo(macroName)
	if ctexture and not overwrite then
		StaticPopup_Show(util.addonName.."MACRO_EXISTS", macroName, nil, function()
			self:createMacro(macroName, buttonName, ctexture, openMacroFrame, true)
		end)
		return
	end

	local macro = "/click "..buttonName
	if GetCVarBool("ActionButtonUseKeyDown") then
		macro = macro.." LeftButton 1"
	end

	if overwrite then
		EditMacro(macroName, macroName, texture, macro)
	else
		CreateMacro(macroName, texture, macro)
	end

	if not openMacroFrame then return end

	if not IsAddOnLoaded("Blizzard_MacroUI") then
		LoadAddOn("Blizzard_MacroUI")
	end

	if not MacroFrame:IsShown() then
		local centerFrame, allowOtherPanels = GetUIPanel("center")
		if centerFrame then
			allowOtherPanels = centerFrame:GetAttribute("UIPanelLayout-allowOtherPanels")
			centerFrame:SetAttribute("UIPanelLayout-allowOtherPanels", 1)
		end
		ShowUIPanel(MacroFrame, 1)
		if centerFrame then
			centerFrame:SetAttribute("UIPanelLayout-allowOtherPanels", allowOtherPanels)
		end
	end

	local index = GetMacroIndexByName(macroName)
	MacroFrame.MacroSelector:OnSelection(index)
	MacroFrame.MacroSelector:ScrollToSelectedIndex()
end


config:SetScript("OnHide", function()
	binding:resetBinding()
end)