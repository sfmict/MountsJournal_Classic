local addon, ns = ...
local L, mounts, journal = ns.L, ns.mounts, ns.journal
local specificDB = ns.specificDB


function journal.filters.specific(btn, level)
	local info = {}
	info.keepShownOnClick = true
	info.isNotRadio = true
	info.notCheckable = true

	info.text = CHECK_ALL
	info.func = function()
		journal:setAllFilters("specific", true)
		journal:updateMountsList()
		btn:ddRefresh(level)
	end
	btn:ddAddButton(info, level)

	info.text = UNCHECK_ALL
	info.func = function()
		journal:setAllFilters("specific", false)
		journal:updateMountsList()
		btn:ddRefresh(level)
	end
	btn:ddAddButton(info, level)

	info.notCheckable = nil
	local specific = mounts.filters.specific

	for k, t in pairs(specificDB) do
		info.text = L[k]
		info.func = function(_,_,_, value)
			specific[k] = value
			journal:updateMountsList()
		end
		info.checked = function() return specific[k] end
		btn:ddAddButton(info, level)
	end

	info.text = L["transform"]
	info.func = function(_,_,_, value)
		specific.transform = value
		journal:updateMountsList()
	end
	info.checked = function() return specific.transform end
	btn:ddAddButton(info, level)

	info.text = L["additional"]
	info.func = function(_,_,_, value)
		specific.additional = value
		journal:updateMountsList()
	end
	info.checked = function() return specific.additional end
	btn:ddAddButton(info, level)

	info.text = L["rest"]
	info.func = function(_,_,_, value)
		specific.rest = value
		journal:updateMountsList()
	end
	info.checked = function() return specific.rest end
	btn:ddAddButton(info, level)
end