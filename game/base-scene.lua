local SceneService = require "core.service.scene"
local TimerService = require "core.service.timer"
local TweenService = require "core.service.tween"
local AssetService = require "core.service.asset"

local DefaultScene = extends "core.scene"

function DefaultScene:__name()
	error "NYI"
end

DefaultScene.services = {
	[SceneService] = {},
	[TimerService] = {},
	[TweenService] = {},
	[AssetService] = {}
}

return DefaultScene
