local TimerService, TweenService = require "game.services.timer", require "game.services.tween"

local BattleScene = extends "core.scene"

function BattleScene:__name()
	return "Battle Scene"
end

BattleScene.services = {TimerService, TweenService}

function BattleScene:new()
end

function BattleScene:draw()
	love.graphics.rectangle("fill", 100, 100, 75, 75)
end

return BattleScene
