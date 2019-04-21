local LayoutService = require "game.map-editor.service.layout"

local EntitiesPane = extends "core.tool"

function EntitiesPane:new()
	self.ui_service = inject(LayoutService)
end

EntitiesPane.title = "entities"

function EntitiesPane:draw()
	imgui.SetNextWindowPos(
		(self.ui_service:vh() * 70) - self.ui_service:padding(),
		(self.ui_service:padding() * 3)
	)
	imgui.SetNextWindowSize(
		(self.ui_service:vh() * 20) - (self.ui_service:padding() * 2),
		(self.ui_service:vh() * 100) - (self.ui_service:padding() * 4)
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

return EntitiesPane
