---@class Service : Object
local Service = extends "object"

Service.__alias = "Unnamed Service"

Service.__callbacks = {}

Service.__tools = require "core.service-tool"

return Service
