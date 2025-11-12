local addon, ns = ...
local util, mounts = ns.util, ns.mounts


GameTooltip:HookScript("OnTooltipSetUnit", function(tooltip)
	if not InCombatLockdown() and mounts.config.tooltipMount then
		local _, unit = tooltip:GetUnit()
		if unit then
			local spellID, mountID = util.getUnitMount(unit)
			if spellID then
				local name, _, icon = util.getMountInfo(mountID or ns.additionalMounts[spellID])
				tooltip:AddLine(("\n|T%s:18:18|t %s"):format(icon, name))
			end
		end
	end
end)