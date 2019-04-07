--[[NYI TODO]]

local binpack = library "binpack"
local Spritesheet = extends "object"
--[[
	Images is a list of image properties
	This often looks like this:
	{
		alias = "test",
		offset = {x = 0, y = 0},
		path = "assets/blah.png"
	}
]]
function Spritesheet:new(images)
	self.canvas = love.graphics.newCanvas()
end

function Spritesheet:get(name)

end

return Spritesheet