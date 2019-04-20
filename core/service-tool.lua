---@class ServiceTool : HiddenTool
local ServiceTool = extends "core.hidden-tool"

---@public
---@return string
function ServiceTool:friendly_name()
	return "service alias undefined"
end

return ServiceTool