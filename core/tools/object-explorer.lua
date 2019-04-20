---@class ObjectExplorer : Object
local ObjectExplorer = extends "core.tool"

local imgui, pairs, tostring, type, getmetatable = imgui, pairs, tostring, type, getmetatable

ObjectExplorer.title = "Object Explorer"

function ObjectExplorer:new(object)
	self.super.new(self, object)
end

---@private
function ObjectExplorer:__expand_node(name, value)
	if value.__tools then
			-- Initialize the tools if they haven't been created yet
		if not value.__tools:initialized() then
			value.__tools = value.__tools(value)
		end
		-- Don't show on object explorer if this tool is explicitly hidden
		if value.__tools:hidden() then
			return
		end
	end

	if imgui.TreeNode(name .. ": " .. tostring(value)) then
		if value.__tools then
			-- Toggle the visibility with a tools button
			if imgui.Button "tools" then
				value.__tools:toggle_window()
			end
			-- Draw a window to render the tools if they are available
			if value.__tools.__window_visibility then
				imgui.Begin(name .. ": tools")
				value.__tools:draw()
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

function ObjectExplorer:draw()
	imgui.Begin(self.title)
	for child_name, child_value in pairs(self:ref()) do
		self:__expand_node(child_name, child_value)
	end
	imgui.End()
end

return ObjectExplorer
