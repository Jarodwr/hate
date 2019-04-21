---@class ServiceTool : HiddenTool
local ServiceTool = extends "core.tool"

---@public
---@return string
function ServiceTool:friendly_name()
	log.warn "service doesn't have a friendly name, will not be able to access this service's tools"
	return nil
end

function ServiceTool:hidden()
	return true
end

return ServiceTool
