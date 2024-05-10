local addon, L = ...
local mounts = MountsJournal
local config = MountsJournalConfig
local journal = MountsJournalFrame
local test = CreateFrame("Frame")
test:RegisterEvent("PLAYER_ENTERING_WORLD")


local ignoreEvents = {
	["SPELL_ACTIVATION_OVERLAY_HIDE"] = true,
	["ARENA_SEASON_WORLD_STATE"] = true,
	["PVP_RATED_STATS_UPDATE"] = true,
	["UNIT_AURA"] = true,
	["BAG_UPDATE_COOLDOWN"] = true,
	["GLOBAL_MOUSE_DOWN"] = true,
	["GLOBAL_MOUSE_UP"] = true,
	["PLAYER_STOPPED_MOVING"] = true,
	["PLAYER_STARTED_MOVING"] = true,
	["ACTIONBAR_SLOT_CHANGED"] = true,
	["ACTIONBAR_UPDATE_COOLDOWN"] = true,
	["SPELL_UPDATE_USABLE"] = true,
	["MODIFIER_STATE_CHANGED"] = true,
	["SPELL_UPDATE_COOLDOWN"] = true,
	["UPDATE_FACTION"] = true,
	["UNIT_POWER_FREQUENT"] = true,
	["UNIT_POWER_UPDATE"] = true,
	-- [""] = true,
	-- [""] = true,
	-- [""] = true,
}


test:SetScript("OnEvent", function(self, event, ...)
	if self[event] then
		fprint(event, ...)
		self[event](self, ...)
	else
		if not ignoreEvents[event] then
			fprint("None:", event, ...)
		end
	end
end)
test:RegisterEvent("ADDON_LOADED")
-- test:RegisterAllEvents()

test:RegisterEvent("UI_MODEL_SCENE_INFO_UPDATED")

-- test:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
-- function test:COMBAT_LOG_EVENT_UNFILTERED()
-- 	fprint(CombatLogGetCurrentEventInfo())
-- end

-- test:RegisterEvent("UI_MODEL_SCENE_INFO_UPDATED")
-- test:RegisterEvent("PET_JOURNAL_PET_DELETED")
-- test:RegisterEvent("PET_JOURNAL_PETS_HEALED")
-- test:RegisterEvent("PET_JOURNAL_CAGE_FAILED")
-- test:RegisterEvent("BATTLE_PET_CURSOR_CLEAR")
-- test:RegisterEvent("COMPANION_UPDATE")
-- test:RegisterEvent("PET_BATTLE_LEVEL_CHANGED")
-- test:RegisterEvent("PET_BATTLE_QUEUE_STATUS")
-- test:RegisterEvent("UI_MODEL_SCENE_INFO_UPDATED")
-- test:RegisterEvent("COMPANION_LEARNED")
-- test:RegisterEvent("SKILL_LINES_CHANGED")
-- test:RegisterEvent("COMPANION_UNLEARNED")

-- test:RegisterEvent("CALENDAR_ACTION_PENDING")
-- test:RegisterEvent("CALENDAR_UPDATE_EVENT")

-- if AddOnSkins then
	-- local AS = unpack(AddOnSkins)

	-- function AS:SkinMountsJournal()
	-- 	local function reskinMainConfig(self)
	-- 		for _, frame in ipairs({self:GetChildren()}) do
	-- 			local ftype = frame:GetObjectType()
	-- 			if ftype == "Frame" then
	-- 				AS:SkinBackdropFrame(frame)
	-- 				for i, frame in ipairs({frame:GetChildren()}) do
	-- 					ftype = frame:GetObjectType()
	-- 					fprint(i, ftype)
	-- 					if ftype == "Button" then
	-- 						AS:SkinButton(frame)
	-- 					end
	-- 				end
	-- 			elseif ftype == "Button" then
	-- 				AS:SkinButton(frame)
	-- 			end
	-- 		end
	-- 		AS:SkinCheckBox(self.waterJump)
	-- 	end

	-- 	if MountsJournalConfig:IsShown() then
	-- 		reskinMainConfig(MountsJournalConfig)
	-- 	else
	-- 		MountsJournalConfig:HookScript("OnShow", function(self)
	-- 			self:SetScript("OnShow", nil)
	-- 			reskinMainConfig(self)
	-- 		end)
	-- 	end
	-- end

-- 	AS:RegisterSkin(addon, AS.SkinMountsJournal)
-- end

-- local f = CreateFrame("FRAME", nil, UIParent)
-- f:SetFrameStrata("BACKGROUND")
-- f:SetPoint("TOPLEFT", ChatFrame1)
-- f:SetPoint("BOTTOMRIGHT", ChatFrame1)
-- f:SetAlpha(0)
-- f.bg = f:CreateTexture(nil, "BACKGROUND")
-- f.bg:SetColorTexture(0, 0, 0)
-- f.bg:SetAllPoints()
-- f:SetScript("OnEnter", function(self)
-- 	UIFrameFadeRemoveFrame(self)
-- 	self:SetAlpha(1)
-- end)
-- f:SetScript("OnLeave", function(self)
-- 	local delay, oldAlpha, newAlpha = 1, self:GetAlpha(), 0
-- 	UIFrameFadeOut(self, delay, oldAlpha, newAlpha)
-- end)

-- C_Timer.After(.5, function()
-- 	local btn = CreateFrame("BUTTON", "my_asd2", Minimap)
-- 	btn:SetSize(31, 31)
-- 	btn:SetNormalTexture("Interface\\Icons\\xp_icon")
-- 	btn:SetScript("OnClick", function() fprint("asd") end)
-- 	btn:SetScript("OnEnter", function() fprint("enter asd") end)
-- 	btn:SetScript("OnLeave", function() fprint("leave asd") end)
-- 	C_Timer.NewTicker(3, function()
-- 		btn:GetScript("OnEnter")(btn)
-- 		btn:GetScript("OnLeave")(btn)
-- 	end)
-- end)

-- local btn = CreateFrame("BUTTON", nil, Minimap)
-- btn:SetSize(31, 31)
-- btn:SetNormalTexture("Interface\\Artifacts\\ArtifactPower-QuestBorder")
-- btn:SetScript("OnClick", function() fprint("asd2") end)

-- local needsFanfare = C_MountJournal.NeedsFanfare
-- local mFanfare = {
-- 	[1049] = true,
-- 	[896] = true,
-- }

-- C_MountJournal.NeedsFanfare = function(mountID)
-- 	return mFanfare[mountID] or needsFanfare(mountID)
-- end

-- local clearFanfare = C_MountJournal.ClearFanfare
-- C_MountJournal.ClearFanfare = function(mountID)
-- 	if mFanfare[mountID] then
-- 		mFanfare[mountID] = nil
-- 	else
-- 		clearFanfare(mountID)
-- 	end
-- end

-- local getNumMountsNeedingFanfare = C_MountJournal.GetNumMountsNeedingFanfare
-- C_MountJournal.GetNumMountsNeedingFanfare = function()
-- 	local num = getNumMountsNeedingFanfare()
-- 	for mountID in pairs(mFanfare) do
-- 		num = num + 1
-- 	end
-- 	return num
-- end

-- GROUP_ROSTER_UPDATE

-- fprint(dumpe, getmetatable(CreateFrame("EventFrame", nil, UIParent)))

function test:PLAYER_ENTERING_WORLD()
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	-- local ids = {}
	-- local function tooLong(start, stop, func)
	-- 	local max = start + 5000000
	-- 	fprint(start, max)
	-- 	if max > stop then max = stop end
	-- 	for i = start, max do func(i) end
	-- 	fprint(dump, ids)
	-- 	if max < stop then
	-- 		C_Timer.After(0, function() tooLong(max + 1, stop, func) end)
	-- 	end
	-- end

	-- tooLong(0, 4294967295, function(i)
	-- 	if C_ModelInfo.GetModelSceneCameraInfoByID(i) then
	-- 		fprint(i)
	-- 		ids[#ids + 1] = i
	-- 	end
	-- end)

	-- for i = 1, 500000 do
	-- 	local name = GetSpellInfo(i)
	-- 	if IsSpellKnown(i) then
	-- 		fprint(name, i)
	-- 	end
	-- end

	-- self.a = function(...) return ... end
	-- local err, r = xpcall(self.a, geterrorhandler(), "dsa")
	-- fprint("asd", err, r)

	-- local str = [[
	-- 	return function() fprint(exec) end
	-- ]]
	-- local loadedFunction, err = loadstring(str)
	-- if err then
	-- 	fprint(err)
	-- else
	-- 	setfenv(loadedFunction, {exec = "WoW", fprint = fprint, _G = _G})
	-- 	local success, func = pcall(loadedFunction)
	-- 	if success then
	-- 		func()
	-- 	end
	-- end

	-- for i = 1, 1000 do
	-- 	local info = GetProfessionInfo(i)
	-- 	if info then
	-- 		fprint(i, info)
	-- 	end
	-- end

	-- JOURNAL OPEN
		-- journal:showToggle()
		-- journal.mountDisplay.info.petSelectionBtn:Click()

	-- journal.navBarBtn:Click()
	-- journal.mapSettings.existingListsToggle:Click()
	-- journal.navBar:setMapID(1033)
	-- journal.navBar:setMapID(909)
	-- journal.navBar:setMapID(980)

	-- CONFIG OPEN
	-- local config = HidingBarConfigAddon
	-- local config = MountsJournalConfig
	-- local config = MountsJournalConfigClasses
	-- local config = MountsJournalConfigAbout
	-- if InterfaceOptionsFrameAddOns:IsVisible() and config:IsVisible() then
	-- 	InterfaceOptionsFrame:Hide()
	-- else
	-- 	InterfaceOptionsFrame_OpenToCategory(config.name)
	-- 	if not InterfaceOptionsFrameAddOns:IsVisible() then
	-- 		InterfaceOptionsFrame_OpenToCategory(config.name)
	-- 	end
	-- end
	-- select(14,config:GetChildren()):Click()
	-- if true then return end

	-- MOUNT ANIMATION
	-- local modelScene = MountJournal.MountDisplay.ModelScene
	-- local timer
	-- local i = 530
	-- local i = 557
	-- modelScene:HookScript("OnMouseDown", function(self, btn)
	-- 	-- C_PetJournal.SummonPetByGUID("BattlePet-0-000001B3BB78")
	-- 	-- if true then return end
	-- 	-- if self.needsFanFare then return end
	-- 	local actor = self:GetActorByTag("unwrapped")
	-- 	-- local actor2 = self:GetActorByTag("player")
	-- 	actor2 = self:GetPlayerActor()
	-- 	-- actor2:SetModelByUnit("player")
	-- 	local creatureDisplayID, descriptionText, sourceText, isSelfMount, _, modelSceneID, animID, spellVisualKitID, disablePlayerMountPreview = C_MountJournal.GetMountInfoExtraByID(MountJournal.selectedMountID)

	-- 	local actorInfo = C_ModelInfo.GetModelSceneActorInfoByID(1)
		-- fprint(dump, actorInfo)

		-- actor2:SetModelByUnit("player", false)
		-- actor2:ClearModel()
		-- actor:Hide()
		-- actor:SetAlpha(0)
		-- actor:AttachToMount(actor2, animID, spellVisualKitID)
		-- for k,v in pairs(actor) do
		-- 	fprint(k)
		-- end
		-- fprint(C_MountJournal.GetMountInfoExtraByID(MountJournal.selectedMountID))
		-- self.UnwrapAnim.UnwrappedAnim:SetTarget(actor)

		-- local modelSceneType, cameraIDs, actorIDs = C_ModelInfo.GetModelSceneInfoByID(self.modelSceneID)
		-- local actorInfo = C_ModelInfo.GetModelSceneActorInfoByID(actorIDs[3])
		-- fprint(dump, C_ModelInfo.GetModelSceneActorDisplayInfoByID(actorInfo.modelActorDisplayID))
		-- fprint(dump, C_ModelInfo.GetModelSceneInfoByID(self.modelSceneID))
		-- C_ModelInfo.GetModelSceneActorDisplayInfoByID()
		-- UIModelSceneActorDisplayInfo

		-- WALK            4 119
		-- WALK BACK       13
		-- RUN             5 143
		-- IN WATTER       41 532
		-- SWIMM           42 540
		-- SWIMM BACK      45 534
		-- FLIGHT          548
		-- FLIGHT FORWARD  135 556 558
		-- FLIGHT BACK     550 562
		-- SPECIAL         94 636

		-- ANIMATION KIT
		-- WALK            565
		-- WALK BACK
		-- RUN             603
		-- IN WATTER       557
		-- SWIMM
		-- SWIMM BACK
		-- FLIGHT
		-- FLIGHT FORWARD
		-- FLIGHT BACK
		-- SPECIAL
		-- DEMONIC         651
		-- LEFT RIGHT      349

		-- PLAYER 91
		-- local mountDisplay = self:GetParent()
		-- if actor then
		-- 	if btn == "RightButton" then
		-- 		i = i + (IsShiftKeyDown() and -1 or 1)
		-- 	end
		-- 	fprint(i)
		-- 	actor:StopAnimationKit()
		-- 	-- actor:SetAnimationBlendOperation(LE_MODEL_BLEND_OPERATION_ANIM)
		-- 	actor:PlayAnimationKit(i, IsAltKeyDown() and 0 or nil)
		-- 	-- actor:SetAnimation(i)
		-- 	-- actor2:SetAnimation(i)
		-- 	-- if timer then timer:Cancel() end

		-- 	-- local lastDisplayed = mountDisplay.lastDisplayed
		-- 	-- timer = C_Timer.NewTimer(10, function()
		-- 	-- 	if mountDisplay.lastDisplayed == lastDisplayed then
		-- 	-- 		actor:SetAnimation(0)
		-- 	-- 	end
		-- 	-- end)
		-- end
	-- end)
end

-- SetClampRectInsets
-- GetBuildInfo
-- C_PetJournal.SummonRandomPet(true)
-- C_PetJournal.SummonPetByGUID(PetJournalPetCard.petID)
-- C_PetJournal.GetSummonedPetGUID()

-- DEBUG IN MILLISECONDS
-- debugprofilestart()
-- for i = 1, 10000 do
-- end
-- fprint(debugprofilestop())

-- UpdateAddOnMemoryUsage()
-- fprint(GetAddOnMemoryUsage(addon) / 1024, addon)

-- /dump MountJournal.ListScrollFrame.scrollBar:SetValue((46 * 2 - .00000000001) /46)

----------------------------------
-- DATA

-- TO RETAIL
-- C_Timer.After(0, function()
-- 	local asd = {}
-- 	for id, v in next, mounts.mountsDB do
-- 		if v[2] == 0 then
-- 			local name, spellID = C_MountJournal.GetMountInfoByID(id)
-- 			asd[spellID] = {name, v}
-- 		end
-- 	end
-- 	fprint(dumpe, asd)
-- end

-- RETAIL
-- C_Timer.After(0, function()
-- 	local asd2 = {}
-- 	for id, v in next, asd do
-- 		local mountID = C_MountJournal.GetMountFromSpell(id)
-- 		if mountID then
-- 			local name, spellID, icon, active, isUsable, sourceType, isFavorite, isFactionSpecific, faction, shouldHideOnChar, isCollected = C_MountJournal.GetMountInfoByID(mountID)
-- 			if name ~= v[1] then
-- 				fprint("name", name, id, mountID)
-- 			end
-- 			if spellID == id then
-- 				asd2[spellID] = v[2]
-- 				asd2[spellID][2] = sourceType
-- 			else
-- 				fprint("spell error", id, spellID)
-- 			end
-- 		else
-- 			fprint("no mount", id)
-- 		end
-- 	end
-- 	fprint(dumpe, asd2)
-- end)

-- FORMAT
-- C_Timer.After(0, function()
-- 	for id, v in next, asd2 do
-- 		mounts.mountsDB[C_MountJournal.GetMountFromSpell(id)] = v
-- 	end
-- 	fprint(dumpe, mounts.mountsDB)
-- end)