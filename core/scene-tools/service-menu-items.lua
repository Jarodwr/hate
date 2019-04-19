local state = require "core.state"

local ServiceMenuItems = extends "object"

local imgui, ipairs = imgui, ipairs

ServiceMenuItems.title = "Service Explorer"

function ServiceMenuItems:new()
	local _, services = state.get()
	self.services = services
	self.opened_windows = {}
end

function ServiceMenuItems:draw()
	for key, service in ipairs(self.services) do
		if service.__alias then
			if imgui.MenuItem(service.__alias) then
				--ACTIVATE SERVICE WINDOW
				self.opened_windows[key] = not self.opened_windows
			end
		end
	end
end

return ServiceMenuItems