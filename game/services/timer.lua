local tick = library "tick"

return function()
	local group = tick.group()

	return "timer", setmetatable(
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
