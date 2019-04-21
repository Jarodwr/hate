local LayoutService = require "game.map-editor.service.layout"

local ParametersPane = extends "core.tool"

function ParametersPane:new()
	self.ui_service = inject(LayoutService)
end

ParametersPane.title = "parameters"

function ParametersPane:draw()
	imgui.SetNextWindowPos(
		(self.ui_service:vh() * 50),
		(self.ui_service:padding() * 3)
	)
	imgui.SetNextWindowSize(
		(self.ui_service:vh() * 20) - (self.ui_service:padding() * 2),
		(self.ui_service:vh() * 50) - (self.ui_service:padding() * 3)
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

return ParametersPane
