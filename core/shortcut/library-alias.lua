--This is used to more nicely include libraries
--For example if I wanted to include tick.lua, instead of typing:
-- require "library.tick.tick"
--I would need to just type:
--library "tick"
return function(path)
	return require("library." .. path .."." .. path)
end
