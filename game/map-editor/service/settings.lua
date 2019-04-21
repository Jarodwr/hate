local SettingsService = extends "core.service"

local HelpWindow = require "game.map-editor.ui.windows.help"

function SettingsService:toggle_help_window()
	if self.window_service:is_open "help" then
		self.window_service:close_window "help"
	else
		self.window_service:open_window("help", HelpWindow())
	end
end

local Callbacks = {}

local WindowService = require "game.map-editor.service.window"

function Callbacks:on_init()
	self.window_service = inject(WindowService)
end

function SettingsService:get_callbacks()
	return Callbacks
end

return SettingsService
