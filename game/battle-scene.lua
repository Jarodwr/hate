local InputService = require "game.services.input"

local BattleScene = extends "game.base-scene"

function BattleScene:__name()
	return "Battle Scene"
end

BattleScene.services = {
	InputService {
		controls = {
			left = {"key:left", "key:a", "axis:leftx-", "button:dpleft"},
			right = {"key:right", "key:d", "axis:leftx+", "button:dpright"},
			up = {"key:up", "key:w", "axis:lefty-", "button:dpup"},
			down = {"key:down", "key:s", "axis:lefty+", "button:dpdown"},
			action = {"key:x", "button:a"}
		}
	}
}

function BattleScene:new()
end

function BattleScene:update(dt)
end

function BattleScene:draw()
	hate.asset.image("image", "dawnblocker", "brick", "lg", "1"):draw()
end

return BattleScene
