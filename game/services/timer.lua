local tick = library "tick"

local name = "timer"

return function()
	local group = tick.group()

	return name, setmetatable(
		{},
		{
			__call = function(self, ...)
				return group.delay(group, ...)
			end,
			__callbacks = {
				update = function(dt)
					group.update(group, dt)
				end
			}
		}
	)
end
