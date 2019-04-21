local LayoutService = require "game.map-editor.service.layout"

local InspectorPane = extends "core.tool"

function InspectorPane:new()
	self.ui_service = inject(LayoutService)
end

InspectorPane.title = "inspector"

function InspectorPane:draw()
	imgui.SetNextWindowPos(
		(self.ui_service:vh() * 30) + self.ui_service:padding(),
		(self.ui_service:padding() * 3)
	)
	imgui.SetNextWindowSize(
		(self.ui_service:vh() * 20) - (self.ui_service:padding() * 2),
		(self.ui_service:vh() * 20) - (self.ui_service:padding() * 3)
	)
	imgui.Begin(
		self.title,
		nil,
		{
			"ImGuiWindowFlags_NoMove",
			"ImGuiWindowFlags_NoResize",
			"ImGuiWindowFlags_NoCollapse",
			"ImGuiWindowFlags_NoNav",
			"ImGuiWindowFlags_NoBringToFrontOnFocus"
		}
	)
	imgui.End()
end

return InspectorPane