local ObjectExplorer = extends "object"

local imgui, pairs, tostring, type = imgui, pairs, tostring, type

ObjectExplorer.title = "Object Explorer"

function ObjectExplorer:new(object)
	self.object = object
	self.expansions = {}
end

---@private
function ObjectExplorer:__expand_node(name, value)
	if imgui.TreeNode(name .. ": " .. tostring(value)) then
		-- Deal with an object's tools
		if value.__tools then
			-- Initialize the tools if they haven't been created yet
			if not value.__tools:initialized() then
				value.__tools = value.__tools(value)
			end
			-- Toggle the visibility with a tools button
			if imgui.Button "tools" then
				value.__tools:toggle_visibility()
			end
			-- Draw a window to render the tools if they are available
			if value.__tools.__visible then
				imgui.Begin(name .. ": tools")
				value.__tools:draw()
				imgui.End()
			end
		end

		-- generate metatable row
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
	for child_name, child_value in pairs(self.object) do
		self:__expand_node(child_name, child_value)
	end
	imgui.End()
end

return ObjectExplorer
