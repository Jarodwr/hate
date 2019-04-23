local Map = require "game.battle.map"

local AssetService = require "core.service.asset"
local InputService = require "core.service.input"

local BattleScene = extends "game.base-scene"

function BattleScene:__name()
	return "Battle Scene"
end

BattleScene.services = {
	[InputService] = {
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
	self.asset_service = inject(AssetService)
	self.input_service = inject(InputService)
	self.map = Map(6, 3)
end

function BattleScene:update(dt)
end

function BattleScene:draw()
	self.map:draw()
	-- self.asset_service:image("image", "dawnblocker", "brick", "lg", "1"):draw()
end

return BattleScene
