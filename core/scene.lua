local Scene = extends "object"

function Scene:__name()
	error "Please set a name for the Scene type"
end

for _, callback in ipairs(require "utility.callbacks") do
	Scene[callback] = function()
	end
end

return Scene
