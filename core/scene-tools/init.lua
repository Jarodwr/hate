local ObjectExplorer = require "core.scene-tools.object-explorer"
local ShortcutsWindow = require "core.scene-tools.shortcuts"

local SceneTools = extends "core.tool"

function SceneTools:new()
	self.show_object_explorer = true
	self.show_service_explorer = false
	self.show_shortcuts = true

	self.object_explorer = ObjectExplorer(self:ref())
	self.shortcuts = ShortcutsWindow()
end

function SceneTools:draw()
	-- Menu
	if imgui.BeginMainMenuBar() then

		if imgui.BeginMenu "File" then
			imgui.MenuItem "Load"
			imgui.EndMenu "File"
		end

		if imgui.BeginMenu "Edit" then
			imgui.EndMenu "Edit"
		end

		if imgui.BeginMenu "Window" then
			if imgui.MenuItem "Object Explorer" then
				self.show_object_explorer = not self.show_object_explorer
			end
			if imgui.MenuItem "Service Explorer" then
				self.show_service_explorer = not self.show_service_explorer
			end
			imgui.EndMenu "Window"
		end

		if imgui.BeginMenu "Help" then
			if imgui.MenuItem "Shortcuts" then
				self.show_shortcuts = not self.show_shortcuts
			end
			imgui.EndMenu "Help"
		end

		imgui.EndMainMenuBar()
	end

	if self.show_object_explorer then
		self.object_explorer:draw()
	end

	if self.show_shortcuts then
		self.shortcuts:draw()
	end

	imgui.ShowDemoWindow(true)
end

return SceneTools
