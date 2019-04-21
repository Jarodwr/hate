local LayoutService = require "game.map-editor.service.layout"

local PropertiesPane = extends "core.tool"

function PropertiesPane:new()
	self.ui_service = inject(LayoutService)
end

PropertiesPane.title = "properties"

function PropertiesPane:draw()
	imgui.SetNextWindowPos(
		(self.ui_service:vh() * 30) + self.ui_service:padding(),
		(self.ui_service:vh() * 20) + (self.ui_service:padding())
	)
	imgui.SetNextWindowSize(
		(self.ui_service:vh() * 20) - (self.ui_service:padding() * 2),
		(self.ui_service:vh() * 30) - (self.ui_service:padding())
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

return PropertiesPane
