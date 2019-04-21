local LayoutService = require "game.map-editor.service.layout"

local SelectorPane = extends "core.tool"

function SelectorPane:new()
	self.ui_service = inject(LayoutService)
end

SelectorPane.title = "selector"

function SelectorPane:draw()
	imgui.SetNextWindowPos(
		self.ui_service:padding(),
		(self.ui_service:padding() * 3)
	)
	imgui.SetNextWindowSize(
		(self.ui_service:vh() * 30) - (self.ui_service:padding()),
		(self.ui_service:vh() * 50) - (self.ui_service:padding() * 3)
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

return SelectorPane
