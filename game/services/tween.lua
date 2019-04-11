local flux = library "flux"

return function()
	local group = flux.group()

	return "tween", setmetatable(
		{},
		{
			__call = function(self, ...)
				return group.to(group, ...)
			end,
			__callbacks = {
				update = function(dt)
					group.update(group, dt)
				end
			}
		}
	)
end
