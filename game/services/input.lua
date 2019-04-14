local baton = library "baton"

--Service helper for getting configured inputs and encapsulating some baton behaviours
local function InputService(mapping)
	--Return an initializer function that is set to the new button mapping
	return function()
		local baton_instance = baton.new(mapping)
		return "input", setmetatable(
			{
				get = function(...)
					return baton_instance:get(...)
				end,
				down = function(...)
					return baton_instance:down(...)
				end,
				pressed = function(...)
					return baton_instance:pressed(...)
				end,
				released = function(...)
					return baton_instance:released(...)
				end
			},
			{
				__callbacks = {
					update = function(dt)
						baton_instance:update(dt)
					end
				}
			}
		)
	end
end


return InputService