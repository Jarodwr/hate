local HelpWindow = extends "object"

local WindowService = require "game.map-editor.service.window"

function HelpWindow:new()
	self.window_service = inject(WindowService)
end

function HelpWindow:draw()
	if imgui.Begin "help" then
		imgui.End()
	end
end

return HelpWindow
