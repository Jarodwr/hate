local tick = library "tick"

local function TimerService()
	local group = tick.group()

	return setmetatable(
		{
			delay = function(...)
				return group:delay(...)
			end,
			recur = function(...)
				return group:recur(...)
			end
		},
		{
			__callbacks = {
				pre_update = function(dt)
					group:update(dt)
				end
			}
		}
	)
end

return TimerService