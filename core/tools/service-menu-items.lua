---@class ServiceMenuItems : Object
local ServiceMenuItems = extends "object"

local state = require "core.state"
local imgui, ipairs = imgui, ipairs

ServiceMenuItems.title = "Service Explorer"

function ServiceMenuItems:new()
	local _, services = state.get()
	self.services = services
	for _, service in ipairs(self.services) do
		if not service.__tools:initialized() then
			service.__tools = service.__tools(service)
		end
	end
end

function ServiceMenuItems:draw()
	for key, service in ipairs(self.services) do
		local tools = service.__tools
		if tools:get_window_visibility() then
			tools:draw()
		end
	end
end

---@return void
function ServiceMenuItems:menu_items()
	for key, service in ipairs(self.services) do
		local tools = service.__tools
		if imgui.MenuItem(tools:friendly_name(), "", tools:get_window_visibility()) then
			tools:toggle_window()
		end
	end
end

return ServiceMenuItems
