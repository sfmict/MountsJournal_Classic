local _, ns = ...
local mounts, journal = ns.mounts, ns.journal


function journal.filters.sources(btn, level)
	local info = {}
	info.keepShownOnClick = true
	info.isNotRadio = true
	info.notCheckable = true

	info.text = CHECK_ALL
	info.func = function()
		journal:setAllFilters("sources", true)
		journal:updateBtnFilters()
		journal:updateMountsList()
		btn:ddRefresh(level)
	end
	btn:ddAddButton(info, level)

	info.text = UNCHECK_ALL
	info.func = function()
		journal:setAllFilters("sources", false)
		journal:updateBtnFilters()
		journal:updateMountsList()
		btn:ddRefresh(level)
	end
	btn:ddAddButton(info, level)

	info.notCheckable = nil
	local sources = mounts.filters.sources
	for i = 1, 10 do
		if i ~= 5 then
			info.text = _G["BATTLE_PET_SOURCE_"..i]
			info.func = function(_,_,_, value)
				sources[i] = value
				journal:updateBtnFilters()
				journal:updateMountsList()
			end
			info.checked = function() return sources[i] end
			btn:ddAddButton(info, level)
		end
	end
end