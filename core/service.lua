---@class Service : Object
local Service = extends "object"

Service.__callbacks = {}

Service.__tools = require "core.service-tool"

return Service
