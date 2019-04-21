local utils = {}

---@param value Object @object we're querying for tools
---@return Tool | nil @returns nil if there is no tool
utils.get_tools = function(value)
	if value.__tools then
		-- Initialize the tools if they haven't been created yet
		if not value.__tools:initialized() then
			value.__tools = value.__tools(value)
		end
		-- Don't show on object explorer if this tool is explicitly hidden
		return value.__tools
	end
end

---@param value any
---@return boolean
utils.is_tool_hidden = function(value)
	return value.__hidden
end

return utils
