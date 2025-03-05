local addon, ns = ...
local util, journal, mounts = ns.util, ns.journal, ns.mounts


GameTooltip:HookScript("OnTooltipSetUnit", function(tooltip)
	if not InCombatLockdown() and mounts.config.tooltipMount then
		local _, unit = tooltip:GetUnit()
		if unit then
			local spellID, mountID = util.getUnitMount(unit)
			if spellID then
				local name, _, icon = journal:getMountInfo(mountID or ns.additionalMounts[spellID])
				tooltip:AddLine(("\n|T%s:16:16|t %s"):format(icon, name))
			end
		end
	end
end)