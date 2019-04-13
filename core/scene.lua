local Scene = extends "object"

function Scene:__name()
	error "Please set a name for the Scene type"
end

Scene.services = {}

for _, callback in ipairs(require "core.callbacks") do
	Scene[callback] = function()
	end
end

return Scene
