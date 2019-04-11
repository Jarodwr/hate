local TimerService, TweenService, AssetService = require "game.services.timer", require "game.services.tween", require "game.services.asset"

local BattleScene = extends "core.scene"

function BattleScene:__name()
	return "Battle Scene"
end

BattleScene.services = {TimerService, TweenService, AssetService}

function BattleScene:new()
end

function BattleScene:update(dt)
end

function BattleScene:draw()
	hate.asset.image("image", "dawnblocker", "brick", "lg", "1"):draw()
end

return BattleScene
