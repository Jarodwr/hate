---@class ServiceMenuItems : Object
local ServiceMenuItems = extends "object"

local state = require "core.state"
local imgui, ipairs, table_insert = imgui, ipairs, table.insert

local utils = require "core.utils"

ServiceMenuItems.title = "Service Explorer"

function ServiceMenuItems:new()
	local _, services = state.get()
	self.services = {}
	for _, service in ipairs(services) do
		local tools = utils.get_tools(service)
		if tools ~= nil and tools:alias() ~= nil then
			table_insert(self.services, tools)
		end
	end
end

function ServiceMenuItems:draw()
	for key, service in ipairs(self.services) do
		local tools = utils.get_tools(service)
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
			local tools = utils.get_tools(service)
			if imgui.MenuItem(tools:alias(), "", tools:get_window_visibility()) then
				tools:toggle_window()
			end
		end
	end
end

return ServiceMenuItems
