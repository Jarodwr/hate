local Menubar = extends "object"

local MapService = require "game.map-editor.service.map"

local FileService = require "game.map-editor.service.file"
local EditService = require "game.map-editor.service.edit"
local ViewService = require "game.map-editor.service.view"
local SettingsService = require "game.map-editor.service.settings"

function Menubar:new()
	self.file_service = inject(FileService)
	self.edit_service = inject(EditService)
	self.view_service = inject(ViewService)
	self.settings_service = inject(SettingsService)
	self.map_service = inject(MapService)
end

function Menubar:draw()
	if imgui.BeginMainMenuBar() then
		if imgui.BeginMenu "File" then
			if imgui.MenuItem("New", "ctrl+n") then
				self.file_service:new_file()
			end
			imgui.Separator()
			if imgui.MenuItem("Open", "ctrl+o") then
				self.file_service:open_file()
			end
			if imgui.BeginMenu "Open Recent" then
				local recent_files = self.file_service:recent_files()
				if (#recent_files) == 0 then
					imgui.Text "No Recent Files Found"
				else
					for _, path in ipairs(recent_files) do
						if imgui.MenuItem(path) then
							self.file_service:open_file(path)
						end
					end
				end
				imgui.EndMenu()
			end
			imgui.Separator()
			if imgui.MenuItem("Save", "ctrl+s") then
				self.file_service:save_file()
			end
			if imgui.MenuItem("Save As", "ctrl+shift+s") then
				self.file_service:save_file_as()
			end
			imgui.Separator()
			if imgui.MenuItem("Quit", "ctrl+q") then
				love.event.quit()
			end
			imgui.EndMenu()
		end
		if imgui.BeginMenu "Edit" then
			if imgui.MenuItem("Undo", "ctrl+z") then
				self.map_service:undo()
			end
			if imgui.MenuItem("Redo", "ctrl+y") then
				self.map_service:redo()
			end
			imgui.Separator()
			if imgui.MenuItem("Cut", "ctrl+x") then
				self.edit_service:cut()
			end
			if imgui.MenuItem("Copy", "ctrl+c") then
				self.edit_service:copy()
			end
			if imgui.MenuItem("Paste", "ctrl+v") then
				self.edit_service:paste()
			end
			imgui.EndMenu()
		end
		if imgui.BeginMenu "View" then
			if imgui.MenuItem("Zoom In", "ctrl+'+'") then
				self.view_service:zoom_in()
			end
			if imgui.MenuItem("Zoom Out", "ctrl+'-'") then
				self.view_service:zoom_out()
			end
			if imgui.BeginMenu "Zoom" then
				for _, value in ipairs(self.view_service:get_zoom_levels()) do
					local ticked = self.view_service:get_zoom() == value
					if imgui.MenuItem(tostring(value * 100) .. "%", ticked) then
						self.view_service:set_zoom(value)
					end
				end
				imgui.EndMenu()
			end
			imgui.Separator()
			if imgui.MenuItem "Reset Position" then
				self.view_service:reset_position()
			end
			imgui.EndMenu()
		end
		if imgui.BeginMenu "Maps" then
			local files = self.file_service:open_files()
			if not (#files) == 0 then
				for _, filename in ipairs(files) do
					if imgui.MenuItem(filename) then
						self.file_service:select_file(filename)
					end
				end
			else
				imgui.Text "No maps currently open..."
			end
			imgui.EndMenu()
		end
		if imgui.BeginMenu "Settings" then
			if imgui.MenuItem "Help" then
				self.settings_service:toggle_help_window()
			end
			imgui.EndMenu()
		end
		imgui.EndMainMenuBar()
	end
end

return Menubar
