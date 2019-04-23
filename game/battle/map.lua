local n_array = require "utility.n-array"
local Cell = require "game.battle.cell"

local Map = extends "object"

function Map:new(x, y)
	self.__cells = n_array(6, 3)
	self.__cells:set_aliases {x = 1, y = 2}
end

function Map:draw()
	for coordinate, cell in self.__cells:each() do
		love.graphics.rectangle("fill", coordinate.x * 50, coordinate.y * 50, 20, 20)
	end
end

return Map
