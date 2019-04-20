---@class Scene : Object
local Scene = extends "object"

function Scene:__name()
	error "Please set a name for the Scene type"
end

Scene.services = {}

local SceneTools = require "core.tools.scene"
Scene.__tools = SceneTools

for _, callback in ipairs(require "core.callbacks") do
	Scene[callback] = function()
	end
end

function Scene:destruct()
end

return Scene
