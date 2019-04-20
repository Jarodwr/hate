---@class HiddenTool : Tool
local HiddenTool = extends "core.tool"

function HiddenTool:hidden()
	return true
end

return HiddenTool
