local _, ns = ...
local mounts = ns.mounts
local C_UnitAuras, IsUsableSpell, IsSpellKnown, GetSpellCooldown = C_UnitAuras, IsUsableSpell, IsSpellKnown, GetSpellCooldown
local C_Item, C_Container = C_Item, C_Container
local ltl = LibStub("LibThingsLoad-1.0")
local _,_, raceID = UnitRace("player")
local additionalMounts = {}
local additionalMountBuffs = {}
ns.additionalMounts = additionalMounts
ns.additionalMountBuffs = additionalMountBuffs


----------------------------------------------------------------------
-- METHODS
local function isActive(self)
	return C_UnitAuras.GetPlayerAuraBySpellID(self.spellID)
end


local function setIsFavorite(self, enabled)
	mounts.additionalFavorites[self.spellID] = enabled or nil
	mounts:event("UPDATE_FAVORITES")
end


local function getIsFavorite(self)
	return mounts.additionalFavorites[self.spellID]
end



----------------------------------------------------------------------
-- SPELL AS A MOUNT
local createMountFromSpell do
	local function isUsable(self)
		return IsSpellKnown(self.spellID)
		   and C_Spell.IsSpellUsable(self.spellID)
	end


	local function isCollected() return true end


	function createMountFromSpell(spellID, mountType, expansion, modelSceneID, buffID)
		local t = {
			spellID = spellID,
			buffID = buffID or spellID,
			mountType = mountType,
			expansion = expansion,
			modelSceneID = modelSceneID,
			isActive = isActive,
			isUsable = isUsable,
			canUse = isUsable,
			isCollected = isCollected,
			setIsFavorite = setIsFavorite,
			getIsFavorite = getIsFavorite,
			selfMount = true,
			familyID = 1,
		}
		additionalMounts[t.spellID] = t
		additionalMountBuffs[t.buffID] = t

		local _, icon = ltl:GetSpellTexture(spellID)
		t.icon = icon
		t.name = ltl:GetSpellName(spellID)
		t.sourceText = ""
		t.description = ""
		t.macro = ""

		ltl:Spells(spellID):Then(function()
			t.sourceText = ltl:GetSpellSubtext(spellID) or ""
			t.macro = "/cast "..ltl:GetSpellFullName(spellID)
			t.description = ltl:GetSpellDescription(spellID)
		end)

		return t
	end
end


----------------------------------------------------------------------
----------------------------------------------------------------------
-- RUNNING WILD
local runningWild = createMountFromSpell(87840, 230, 4, 4)

if raceID == 22 then
	runningWild.creatureID = "player"
else
	-- MALE ID 45254 or FEMALE ID 39725
	runningWild.creatureID = UnitSex("player") == 2 and 34344 or 37389
----------------------------------------------------------------------
end

function runningWild:isShown()
	return raceID == 22
end


----------------------------------------------------------------------
-- ITEM AS A MOUNT
local createMountFromItem do
	local function isUsable(self)
		return self:isCollected() and C_Spell.IsSpellUsable(self.spellID)
	end


	local function canUse(self)
		return self:isUsable() and C_Container.GetItemCooldown(self.itemID) == 0
	end


	local function isCollected(self)
		return C_Item.GetItemCount(self.itemID) > 0
	end


	function createMountFromItem(itemID, spellID, creatureID, mountType, expansion, modelSceneID)
		local t = {
			itemID = itemID,
			spellID = spellID,
			buffID = spellID,
			creatureID = creatureID,
			mountType = mountType,
			expansion = expansion,
			modelSceneID = modelSceneID,
			isActive = isActive,
			isUsable = isUsable,
			canUse = canUse,
			isCollected = isCollected,
			isShown = true,
			selfMount = false,
			familyID = 2,
			setIsFavorite = setIsFavorite,
			getIsFavorite = getIsFavorite,
		}
		additionalMounts[t.spellID] = t
		additionalMountBuffs[t.buffID] = t

		t.icon = ltl:GetItemIcon(itemID)
		t.name = ""
		t.sourceText = ""
		t.description = ""
		t.macro = "/use item:"..itemID

		ltl:Everythings(itemID, spellID):Then(function()
			t.name = ltl:GetItemName(itemID)
			t.sourceText = ltl:GetSpellSubtext(spellID) or ""
			t.description = ltl:GetSpellDescription(spellID)
		end)

		return t
	end
end


----------------------------------------------------------------------
-- MAGIC BROOM
local magicBroom = createMountFromItem(37011, 47977, 21939, 248, 2, 4)