local _, ns = ...
local util = ns.util
local type, pairs, rawget, GetUnitSpeed, IsFalling, InCombatLockdown, GetTime, C_Item, GetCVarBool = type, pairs, rawget, GetUnitSpeed, IsFalling, InCombatLockdown, GetTime, C_Item, GetCVarBool
local macroFrame = CreateFrame("FRAME")
ns.macroFrame = macroFrame
util.setEventsMixin(macroFrame)
macroFrame.getGroupType = util.getGroupType -- for conditions


macroFrame:SetScript("OnEvent", function(self, event, ...)
	self[event](self, ...)
end)


macroFrame:on("ADDON_INIT", function(self)
	self.additionalMounts = ns.additionalMounts
	self.calendar = ns.calendar
	self.mounts = ns.mounts
	self.config = self.mounts.config
	self.ruleSetConfig = self.mounts.globalDB.ruleSets
	self.snippets = ns.mounts.globalDB.snippets
	self.sFlags = self.mounts.sFlags
	self.macrosConfig = self.config.macrosConfig
	self.charMacrosConfig = self.mounts.charDB.macrosConfig
	self.conditions = ns.conditions
	self.actions = ns.actions
	self.state = {}
	self.checkRules = {}
	self.class = select(2, UnitClass("player"))
	self.broomID = 37011

	local classOptionMacro = ""
	local defMacro = ""

	if self.class == "PALADIN" then
		local GetShapeshiftForm, GetShapeshiftFormInfo = GetShapeshiftForm, GetShapeshiftFormInfo
		self.getAuraSpellID = function()
			local shapeshiftIndex = GetShapeshiftForm()
			if shapeshiftIndex > 0 then
				local _,_,_, spellID = GetShapeshiftFormInfo(shapeshiftIndex)
				return spellID
			end
		end
	elseif self.class == "PRIEST" or self.class == "MAGE" then
		classOptionMacro = classOptionMacro..[[
			local IsFalling, GetTime, C_UnitAuras = IsFalling, GetTime, C_UnitAuras
		]]
	elseif self.class == "DRUID" then
		local GetShapeshiftForm, GetShapeshiftFormInfo = GetShapeshiftForm, GetShapeshiftFormInfo
		self.getFormSpellID = function()
			local shapeshiftIndex = GetShapeshiftForm()
			if shapeshiftIndex > 0 then
				local _,_,_, spellID = GetShapeshiftFormInfo(shapeshiftIndex)
				return spellID
			end
		end

		classOptionMacro = classOptionMacro..[[
			local GetTime = GetTime
		]]
		defMacro = defMacro..[[
			local GetShapeshiftFormID = GetShapeshiftFormID
		]]
	end

	classOptionMacro = classOptionMacro..[[
		return function(self)
	]]
	defMacro = defMacro..[[
		return function(self)
			local macro
	]]

	if self.class == "PALADIN" then
		self.classDismount = [[
			if self.classConfig.useCrusaderAura then
				local spellID = self.getAuraSpellID()

				if spellID and spellID ~= 32223 then
					self.charMacrosConfig.lastAuraSpellID = spellID
				elseif self.sFlags.isMounted and spellID == 32223 then

					if self.classConfig.returnLastAura and self.charMacrosConfig.lastAuraSpellID then
						local spellName = self:getSpellName(self.charMacrosConfig.lastAuraSpellID)
						if spellName then
							return self:addLine(self:getDismountMacro(), "/cast !"..spellName)
						end
					end

					self.charMacrosConfig.lastAuraSpellID = nil
				end
			end
		]]
		classOptionMacro = classOptionMacro..self.classDismount
		defMacro = defMacro..[[
			if self.classConfig.useCrusaderAura and self.getAuraSpellID() ~= 32223 then
				macro = self:addLine(macro, "/cast !"..self:getSpellName(32223))
			end
		]]
	elseif self.class == "PRIEST" then
		classOptionMacro = classOptionMacro..[[
			-- 1706 - Levitation
			if self.classConfig.useLevitation and not self.magicBroom and IsFalling() then
				if GetTime() - (self.lastUseClassSpellTime or 0) < .5 then
					return ""
				elseif C_UnitAuras.GetPlayerAuraBySpellID(1706) then
					return "/cancelaura "..self:getSpellName(1706)
				else
					self.lastUseClassSpellTime = GetTime()
					return "/cast [@player]"..self:getSpellName(1706)
				end
			end
		]]
	elseif self.class == "DEATHKNIGHT" then
		defMacro = defMacro..[[
			if self.classConfig.usePathOfFrost
			and (not self.classConfig.useOnlyInWaterWalkLocation or self.sFlags.waterWalk)
			and not self.sFlags.swimming
			and not self.sFlags.fly
			then
				macro = self:addLine(macro, "/cast "..self:getSpellName(3714)) -- Path of Frost
			end
		]]
	elseif self.class == "SHAMAN" then
		defMacro = defMacro..[[
			if self.classConfig.useWaterWalking
			and (not self.classConfig.useOnlyInWaterWalkLocation or self.sFlags.waterWalk)
			and not self.sFlags.swimming
			and not self.sFlags.fly
			then
				macro = self:addLine(macro, "/cast [@player]"..self:getSpellName(546)) -- Water Walking
			end
		]]
	elseif self.class == "MAGE" then
		classOptionMacro = classOptionMacro..[[
			-- 130 - Slow Fall
			if self.classConfig.useSlowFall and not self.magicBroom and IsFalling() then
				if GetTime() - (self.lastUseClassSpellTime or 0) < .5 then
					return ""
				elseif C_UnitAuras.GetPlayerAuraBySpellID(130) then
					return "/cancelaura "..self:getSpellName(130)
				else
					self.lastUseClassSpellTime = GetTime()
					return "/cast [@player]"..self:getSpellName(130)
				end
			end
		]]
	elseif self.class == "DRUID" then
		self.classDismount = [[
			-- DRUID LAST FORM
			-- 768 - cat form
			-- 1066 - aquatic form
			-- 783 - travel form
			-- 33943 - flight form
			-- 40120 - swift flight from
			-- 24858 - moonkin form
			local spellID = self.getFormSpellID()
			if self.classConfig.useLastDruidForm then
				if not self.charMacrosConfig.lastDruidFormSpellID then
					self.charMacrosConfig.lastDruidFormSpellID = spellID
				end

				if self.charMacrosConfig.lastDruidFormSpellID
				and spellID ~= 24858
				and (self.sFlags.isMounted
					  or self.sFlags.inVehicle
					  or spellID == 783
					  or spellID == 1066
					  or spellID == 33943
					  or spellID == 40120
					  or self.sFlags.isIndoors and spellID == 768)
				then
					local spellName = self:getSpellName(self.charMacrosConfig.lastDruidFormSpellID)
					if spellName then
						return self:addLine(self:getDismountMacro(), "/cast "..spellName)
					end
				end

				if spellID and spellID ~= 783 and spellID ~= 1066 and spellID ~= 33943 and spellID ~= 40120 then
					self.charMacrosConfig.lastDruidFormSpellID = spellID
					self.lastDruidFormTime = GetTime()
				elseif not spellID and GetTime() - (self.lastDruidFormTime or 0) > 1 then
					self.charMacrosConfig.lastDruidFormSpellID = nil
				end
			elseif spellID == 783 or spellID == 1066 or spellID == 33943 or spellID == 40120 then
				local spellName = self:getSpellName(spellID)
				if spellName then
					return "/cast "..spellName
				end
			end

			if self.classConfig.useTravelIfCantFly
			and self.macro
			and self.mounts.instanceID ~= 530
			and not self.sFlags.fly
			and not self.sFlags.isIndoors
			and not self.sFlags.isSubmerged
			and not self.sFlags.isMounted
			and not self.sFlags.inVehicle
			and (self.classConfig.useMacroAlways and not self.classConfig.useMacroOnlyCanFly
			     or not self.magicBroom and (GetUnitSpeed("player") > 0
			                                 or IsFalling()))
			then
				if spellID == 783 then
					return self:addLine(self:getDismountMacro(), "/cancelform")
				elseif spellID ~= 33943 and spellID ~= 40120 then
					return self:addLine(self:getDismountMacro(), "/cancelform\n/cast "..self:getSpellName(783))
				end
			end
		]]
		classOptionMacro = classOptionMacro..self.classDismount
		defMacro = defMacro..[[
			if GetShapeshiftFormID() then
				macro = self:addLine(macro, "/cancelform")
			end
		]]
	end

	classOptionMacro = classOptionMacro..[[
		end
	]]
	defMacro = defMacro..[[
			return macro
		end
	]]

	self.getClassOptionMacro = self:loadString(classOptionMacro)
	self.getDefMacro = self:loadString(defMacro)
	self:setRuleSet()

	self:RegisterEvent("LEARNED_SPELL_IN_TAB")

	self:refresh()
	self:getClassMacro(self.class, function() self:refresh() end)
end)


function macroFrame:setRuleSet(ruleSetName)
	if ruleSetName then
		self.mounts.charDB.currentRuleSetName = ruleSetName
	end
	local currentRuleSetName, currentRuleSet, default = self.mounts.charDB.currentRuleSetName

	for i = 1, #self.ruleSetConfig do
		local ruleSet = self.ruleSetConfig[i]
		if ruleSet.name == currentRuleSetName then
			currentRuleSet = ruleSet
		end
		if ruleSet.isDefault then
			default = ruleSet
		end
	end

	if not currentRuleSet then
		self.mounts.charDB.currentRuleSetName = nil
		currentRuleSet = default
	end

	self.currentRuleSet = currentRuleSet
	self:setRuleFuncs()
end


function macroFrame:loadString(funcStr)
	local loadedFunc, err = loadstring(funcStr)
	if err then
		geterrorhandler()(err)
	else
		return loadedFunc()
	end
end


function macroFrame:setRuleFuncs()
	local function addKeys(vars, keys)
		if not vars then return end
		for i = 1, #vars do
			keys[vars[i]] = true
		end
	end

	for i = 1, #self.currentRuleSet do
		local rules = self.currentRuleSet[i]
		local keys = {}
		local func = [[
local wipe = wipe
return function(self, button, profileLoad, noMacro)
	self.mounts:setFlags()
	self.mounts:resetMountsList()
	self.preUseMacro = nil
	self.useMount = nil
	self.summonMType = nil
	wipe(self.state)
		]]

		for j = 1, #rules do
			local rule = rules[j]
			local condText, condVars = self.conditions:getFuncText(rule)
			local actionText, actionVars = self.actions:getFuncText(rule.action)
			addKeys(condVars, keys)
			addKeys(actionVars, keys)
			func = ("%sif %sthen\n%s\nend\n"):format(func, condText, actionText)
		end

		if next(keys) then
			local vars = {}
			for k in next, keys do
				vars[#vars + 1] = k
			end
			local varsText = table.concat(vars, ", ")
			func = ("local %s = %s\n%s"):format(varsText, varsText, func)
		end

		func = func..[[
	self.mounts:updateFlagsWithMap()

	if self.useMount then
		local macro = self:getDefMacro()

		if self.preUseMacro then
			macro = self:addLine(macro, self.preUseMacro)
		end

		if self.additionalMounts[self.useMount] then
			macro = self:addLine(macro, self.additionalMounts[self.useMount].macro)
			self.useMount = false
		end
		return macro
	end

	self.mounts:setEmptyList()
	return self:getMacro(noMacro)
end
		]]
		self.checkRules[i] = self:loadString(func)
	end
end


function macroFrame:setMacro()
	self.macro = nil
	if self.classConfig.macroEnable then
		self.macro = self.classConfig.macro or self:getClassMacro()
	end
end


function macroFrame:setCombatMacro()
	self.combatMacro = nil
	if self.classConfig.combatMacroEnable then
		self.combatMacro = self.classConfig.combatMacro or self:getClassMacro()
	end
end


function macroFrame:refresh()
	self.classConfig = self.charMacrosConfig.enable and self.charMacrosConfig or self.macrosConfig[self.class]
	self:setMacro()
	self:setCombatMacro()
end
macroFrame.LEARNED_SPELL_IN_TAB = macroFrame.refresh


function macroFrame:addLine(text, line)
	if text ~= nil and #text > 0 then
		return text.."\n"..line
	else
		return line
	end
end


do
	local spellCache = {}
	function macroFrame:getSpellName(spellID, cb)
		if spellCache[spellID] then
			return spellCache[spellID]
		else
			local name = GetSpellInfo(spellID)
			if C_Spell.IsSpellDataCached(spellID) then
				local subText = GetSpellSubtext(spellID)
				if #subText > 0 then
					name = name.."("..subText..")"
				end
				spellCache[spellID] = name
			elseif cb then
				Spell:CreateFromSpellID(spellID):ContinueOnSpellLoad(cb)
			end
			return name
		end
	end
end


function macroFrame:getDismountMacro()
	return self:addLine("/leavevehicle [vehicleui]", "/dismount [mounted]")
end


do
	local function getClassDefFunc(spellID)
		return function(self, ...)
			local spellName = self:getSpellName(spellID, ...)
			if spellName then
				return "/cast "..spellName
			end
		end
	end


	local classFunc = {
		HUNTER = getClassDefFunc(5118), -- Aspect of the Cheetah
		ROGUE = getClassDefFunc(2983), -- Sprint
		SHAMAN = getClassDefFunc(2645), -- Ghost Wolf
		MAGE = getClassDefFunc(1953), -- Blink
		DRUID = function(self, ...)
			local aquaticForm = self:getSpellName(1066, ...)
			local catForm = self:getSpellName(768, ...)
			local travelForm = self:getSpellName(783, ...)
			local flightFrom = IsSpellKnown(40120) and self:getSpellName(40120, ...)
			                or IsSpellKnown(33943) and self:getSpellName(33943, ...)

			if aquaticForm and catForm and travelForm then
				return ("/cast [swimming]%s;[indoors]%s;[flyable,nocombat]%s;%s"):format(aquaticForm, catForm, flightFrom or travelForm, travelForm)
			end
		end,
	}


	function macroFrame:getClassMacro(class, ...)
		local macro = self:getDismountMacro()

		local classFunc = classFunc[class or self.class]
		if type(classFunc) == "function" then
			local text = classFunc(self, ...)
			if type(text) == "string" and #text > 0 then
				macro = self:addLine(macro, text)
			end
		end

		return macro
	end
end


function macroFrame:isMovingOrFalling()
	return GetUnitSpeed("player") > 0 or IsFalling()
end


function macroFrame:getMacro(noMacro)

	if noMacro then return end
	-- MAGIC BROOM IS USABLE
	self.magicBroom = self.config.useMagicBroom
	                  and not self.sFlags.targetMount
	                  and C_Item.GetItemCount(self.broomID) > 0
	                  and not self.sFlags.isIndoors
	                  and not self.sFlags.swimming

	-- CLASS OPTIONS
	local macro = self:getClassOptionMacro()
	if macro then return macro end

	-- EXIT VEHICLE
	if self.sFlags.inVehicle then
		VehicleExit()
		--macro = "/leavevehicle"
	-- DISMOUNT
	elseif self.sFlags.isMounted then
		if not self.lastUseTime or GetTime() - self.lastUseTime > .5 then
			Dismount()
			--macro = "/dismount"
		end
	-- CLASSMACRO
	elseif self.macro and (
		self.class == "DRUID" and self.classConfig.useMacroAlways and (
			not self.classConfig.useMacroOnlyCanFly or self.sFlags.fly
		)
		or not self.magicBroom and (
			self.sFlags.isIndoors or self:isMovingOrFalling()
		)
	)
	then
		macro = self.macro
	-- MOUNT
	else
		macro = self:getDefMacro()

		if self.preUseMacro then
			macro = self:addLine(macro, self.preUseMacro)
		end

		if self.magicBroom then
			macro = self:addLine(macro, "/use item:"..self.broomID) -- USE ITEM BROOM
			self.lastUseTime = GetTime()
		else
			if self.summonMType then
				self.mounts:setSummonMountByType(self.summonMType, true)
			else
				self.mounts:setSummonMount(true)
			end

			local additionMount
			if self.sFlags.targetMount then
				additionMount = self.additionalMounts[self.sFlags.targetMount]
			else
				additionMount = self.additionalMounts[self.mounts.summonedSpellID]
			end

			if additionMount then
				macro = self:addLine(macro, additionMount.macro)
			elseif not (self.useMount or self.sFlags.targetMount) then
				self.useMount = true
			end
		end
	end

	return macro or ""
end


function macroFrame:getCombatMacro()
	local macro

	if self.combatMacro then
		macro = self:addLine(macro, self.combatMacro)
	elseif self.macro and self.class == "DRUID" and self.classConfig.useMacroAlways then
		macro = self:addLine(macro, self.macro)
	else
		macro = self:addLine(macro, "/mount notNilModifier")
	end
	return macro
end


function util.getClassMacro(...)
	return macroFrame:getClassMacro(...)
end


function util.refreshMacro()
	macroFrame:refresh()
end


MJMacroMixin = {}


function MJMacroMixin:onLoad()
	self.sFlags = ns.mounts.sFlags
	self:RegisterForClicks("AnyUp", "AnyDown")
	self:SetAttribute("type", "macro")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
end


function MJMacroMixin:onEvent(event, ...)
	self:SetAttribute("macrotext", macroFrame:getCombatMacro())
end


function MJMacroMixin:preClick(button, down)
	self.sFlags.forceModifier = macroFrame.currentRuleSet[self.id].altMode
	self.sFlags.summonID = self.id
	local combat = InCombatLockdown()
	local notAction = down ~= GetCVarBool("ActionButtonUseKeyDown")
	self.notUsable = combat or notAction
	if combat then
		return
	elseif notAction then
		self:SetAttribute("macrotext", "")
		return
	end
	self:SetAttribute("macrotext", macroFrame.checkRules[self.id](macroFrame, button))
end


function MJMacroMixin:postClick(button, down)
	if self.notUsable then return end
	if macroFrame.useMount == true then
		ns.mounts:summon()
	elseif macroFrame.useMount then
		ns.mounts:summon(macroFrame.useMount)
	end
end