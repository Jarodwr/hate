---@class ObjectExplorer : Object
local ObjectExplorer = extends "core.tool"

local utils = require "core.utils"
local imgui, pairs, tostring, type, getmetatable = imgui, pairs, tostring, type, getmetatable

ObjectExplorer.title = "Object Explorer"

---@param object any
function ObjectExplorer:new(object)
	self.super.new(self, object)
end

---@private
---@param name string @name of the variable
---@param value any @value of the variable
---@return void
function ObjectExplorer:__expand_node(name, value)
	local tools = utils.get_tools(value)

	--skip rendering this node
	if utils.is_tool_hidden(value) then
		return
	end

	if imgui.TreeNode(name .. ": " .. tostring(value)) then
		if tools ~= nil then
			-- Toggle the visibility with a tools button
			if imgui.Button "tools" then
				tools:toggle_window()
			end
			-- Draw a window to render the tools if they are available
			if tools:get_window_visibility() then
				imgui.Begin(name .. ": tools")
				tools:draw()
				imgui.End()
			end
		end

		-- Show the metatable
		local mt = getmetatable(value)
		if mt ~= nil then
			self:__expand_node("metatable", mt)
		end

		-- Draw all child variables
		for child_name, child_value in pairs(value) do
			local child_type = type(child_value)
			if child_type == "table" then
				self:__expand_node(child_name, child_value)
			else
				imgui.Text(child_name .. ": " .. tostring(child_value))
			end
		end

		imgui.TreePop()
	end
end

---@return void
function ObjectExplorer:draw()
	imgui.Begin(self.title)
	for child_name, child_value in pairs(self:ref()) do
		if not child_name == "__tools" then
			self:__expand_node(child_name, child_value)
		end
	end
	imgui.End()
end

return ObjectExplorer
