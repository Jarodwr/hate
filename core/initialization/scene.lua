local state = require "core.state"

-- Wrapping code to ensure that scene objects are correctly run 
-- without interfering with other callback handling functionality.
state.push(require(config.scene.entry))

for _, callback in ipairs(require("core.callbacks")) do
	-- Save the old callback so we don't completely overwrite it
	local old = love[callback]
	if old then
		-- Create a new callback that calls the old one and calls the new state
		love[callback] = function(...)
			old(...)
		end
	else
		-- Just create a callback that calls the new state
		love[callback] = function(...)
			state.action(callback, ...)
		end
	end
end