local flux = library "flux"

local name = "tween"

return function()
	local group = flux.group()

	return name, setmetatable(
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
