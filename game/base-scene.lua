local TimerService = require "game.services.timer"
local TweenService = require "game.services.tween"
local AssetService = require "game.services.asset"

local DefaultScene = extends "core.scene"

function DefaultScene:__name()
	return "Default Scene"
end

DefaultScene.services = {
	TimerService,
	TweenService,
	AssetService
}

return DefaultScene
