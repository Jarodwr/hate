local MapEditorScene = extends "core.scene"

local AssetService = require "core.service.asset"
local InputService = require "core.service.input"

local cd = "game.map-editor."
-- Services
local LayoutService = require(cd .. "service.layout")
local FileService = require(cd .. "service.file")
local EditService = require(cd .. "service.edit")
local ViewService = require(cd .. "service.view")
local WindowService = require(cd .. "service.window")
local SettingsService = require(cd .. "service.settings")

-- UI Elements
local MainMenuBar = require(cd .. "ui.main-menu-bar")
-- Windows
local PropertiesPane = require(cd .. "ui.panes.properties")
local EditorPane = require(cd .. "ui.panes.editor")
local SelectorPane = require(cd .. "ui.panes.selector")
local LayersPane = require(cd .. "ui.panes.layers")
local InspectorPane = require(cd .. "ui.panes.inspector")
local ParametersPane = require(cd .. "ui.panes.parameters")
local EntitiesPane = require(cd .. "ui.panes.entities")

local DefaultRenderer = require(cd .. "renderer.default")

local imgui, pairs = imgui, pairs

MapEditorScene.services = {
	[AssetService] = {},
	[InputService] = {
		controls = {
			left = {"key:left", "key:a", "axis:leftx-", "button:dpleft"},
			right = {"key:right", "key:d", "axis:leftx+", "button:dpright"},
			up = {"key:up", "key:w", "axis:lefty-", "button:dpup"},
			down = {"key:down", "key:s", "axis:lefty+", "button:dpdown"},
			action = {"mouse:1"},
			context = {"mouse:2"}
		}
	},
	[LayoutService] = {},
	[WindowService] = {},
	[FileService] = {},
	[EditService] = {},
	[ViewService] = {},
	[SettingsService] = {}
}

function MapEditorScene:new()
	self.main_menu_bar = MainMenuBar()
	self.panes = {
		PropertiesPane(),
		EditorPane(),
		SelectorPane(),
		LayersPane(),
		InspectorPane(),
		ParametersPane(),
		EntitiesPane()
	}
	self.window_service = inject(WindowService)
	self.renderer = DefaultRenderer()
end

function MapEditorScene:__name()
	return "Map Editor"
end

function MapEditorScene:update(dt)
	self.renderer:update(dt)
end

function MapEditorScene:draw()
	love.graphics.clear(0.25, 0.25, 0.25, 1)
	self.renderer:draw()
	imgui.NewFrame()
	self.main_menu_bar:draw()
	for _, pane in pairs(self.panes) do
		pane:draw()
	end
	self.window_service:draw_windows()
	imgui.Render()
end

return MapEditorScene
