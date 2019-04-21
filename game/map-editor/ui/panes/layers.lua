local LayoutService = require "game.map-editor.service.layout"

local LayersPane = extends "core.tool"

function LayersPane:new()
	self.ui_service = inject(LayoutService)
end

LayersPane.title = "layers"

function LayersPane:draw()
	imgui.SetNextWindowPos(
		(self.ui_service:vh() * 50),
		self.ui_service:padding() + (self.ui_service:vh() * 50)
	)
	imgui.SetNextWindowSize(
		(self.ui_service:vh() * 20) - (self.ui_service:padding() * 2),
		(self.ui_service:vh() * 50) - (self.ui_service:padding() * 2)
	)
	imgui.Begin(self.title, nil, {
		"ImGuiWindowFlags_NoScrollbar",
		"ImGuiWindowFlags_NoMove",
		"ImGuiWindowFlags_NoResize",
		"ImGuiWindowFlags_NoCollapse",
		"ImGuiWindowFlags_NoNav",
		"ImGuiWindowFlags_NoBringToFrontOnFocus"
	})
	imgui.End()
end

return LayersPane
