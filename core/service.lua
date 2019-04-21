---@class Service : Object
local Service = extends "object"

Service.__tools = require "core.service-tool"

function Service:get_callbacks()
	return {}
end

return Service
