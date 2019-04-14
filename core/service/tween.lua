local flux = library "flux"

local function TweenService()
	local group = flux.group()

	return setmetatable(
		{},
		{
			__call = function(self, ...)
				return group:to(...)
			end,
			__callbacks = {
				pre_update = function(dt)
					group:update(dt)
				end
			}
		}
	)
end

return TweenService
