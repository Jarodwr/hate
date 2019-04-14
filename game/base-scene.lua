local TimerService = require "core.service.timer"
local TweenService = require "core.service.tween"
local AssetService = require "core.service.asset"

local DefaultScene = extends "core.scene"

function DefaultScene:__name()
	return "Default Scene"
end

DefaultScene.services = {
	[TimerService] = {},
	[TweenService] = {},
	[AssetService] = {}
}

return DefaultScene
