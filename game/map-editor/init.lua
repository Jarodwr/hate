local MapEditorScene = extends "core.scene"

local AssetService = require "core.service.asset"
local InputService = require "core.service.input"
local UIService = require "game.map-editor.ui.service"

local cd = "game.map-editor."
local MainMenuBar = require (cd .. "ui.main-menu-bar")
local TilePropertiesWindow = require(cd .. "ui.windows.tile-properties")
local TopDownWindow = require(cd .. "ui.windows.top-down")
local TypeSelectorWindow = require(cd .. "ui.windows.type-selector")
local LayersWindow = require(cd .. "ui.windows.layers")

local imgui, pairs = imgui, pairs

MapEditorScene.services = {
	[AssetService] = {},
	[InputService] = {
		controls = {
			left = {"key:left", "key:a", "axis:leftx-", "button:dpleft"},
			right = {"key:right", "key:d", "axis:leftx+", "button:dpright"},
			up = {"key:up", "key:w", "axis:lefty-", "button:dpup"},
			down = {"key:down", "key:s", "axis:lefty+", "button:dpdown"},
			action = {"key:x", "button:a"}
		}
	},
	[UIService] = {}
}

function MapEditorScene:new()
	self.main_menu_bar = MainMenuBar()
	self.windows = {
		["Tile Properties"] = TilePropertiesWindow(),
		["Editor"] = TopDownWindow(),
		["Tiles"] = TypeSelectorWindow(),
		["Layers"] = LayersWindow()
	}
end

function MapEditorScene:__name()
	return "Map Editor"
end

function MapEditorScene:draw()
	love.graphics.clear(0.25, 0.25, 0.25, 1)
	imgui.NewFrame()
	self.main_menu_bar:draw()
	for name, window in pairs(self.windows) do
		imgui.Begin(name)
		imgui.End()
	end
	imgui.Render()
end

return MapEditorScene
