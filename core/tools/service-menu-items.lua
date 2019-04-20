---@class ServiceMenuItems : Object
local ServiceMenuItems = extends "object"

local state = require "core.state"
local imgui, ipairs, table_insert = imgui, ipairs, table.insert

ServiceMenuItems.title = "Service Explorer"

function ServiceMenuItems:new()
	local _, services = state.get()
	self.services = {}
	for _, service in ipairs(services) do
		if service.__tools then
			if not service.__tools:initialized() then
				service.__tools = service.__tools(service)
			end
			if service.__tools:friendly_name() ~= nil then
				table_insert(self.services, service.__tools)
			end
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
	if #self.services == 0 then
		imgui.MenuItem("No service tools to display.")
	else
		for key, service in ipairs(self.services) do
			local tools = service.__tools
			if imgui.MenuItem(tools:friendly_name(), "", tools:get_window_visibility()) then
				tools:toggle_window()
			end
		end
	end
end

return ServiceMenuItems
