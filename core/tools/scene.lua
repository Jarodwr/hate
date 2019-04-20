---@class SceneTools : Tool
local SceneTools = extends "core.tool"

local ObjectExplorer = require "core.tools.object-explorer"
local ShortcutsWindow = require "core.tools.shortcuts"
local ServiceMenuItems = require "core.tools.service-menu-items"

local imgui = imgui

function SceneTools:new()
	self.service_menu_items = ServiceMenuItems()

	self.show_demo_window = false

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
			if imgui.MenuItem("Object Explorer", "", self.object_explorer:get_window_visibility()) then
				self.object_explorer:toggle_window()
			end
			if imgui.BeginMenu "Services" then
				self.service_menu_items:menu_items()
				imgui.EndMenu()
			end
			imgui.EndMenu "Window"
		end

		if imgui.BeginMenu "Help" then
			if imgui.MenuItem "Shortcuts" then
				-- self.show_shortcuts = not self.show_shortcuts
			end
			if imgui.MenuItem "Demo Window" then
				self.show_demo_window = not self.show_demo_window
			end
			imgui.EndMenu "Help"
		end

		imgui.EndMainMenuBar()
	end

	if self.object_explorer:get_window_visibility() then
		self.object_explorer:draw()
	end

	self.service_menu_items:draw()

	-- if self.show_shortcuts then
	-- 	self.shortcuts:draw()
	-- end
	if self.show_demo_window then
		imgui.ShowDemoWindow(true)
	end
end

return SceneTools
