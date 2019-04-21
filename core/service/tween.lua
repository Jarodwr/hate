local flux = library "flux"

---@class TweenService
local TweenService = extends "core.service"

---@private
function TweenService:new()
	self.__group = flux.group()
end

---@param object table
---@param time number
---@param vars table
---@return Tween
function TweenService:tween(obj, time, vars)
	return self.__group:to(obj, time, vars)
end

local Callbacks = {}

function Callbacks:pre_update(dt)
	self.__group:update(dt)
end

function TweenService:get_callbacks()
	return Callbacks
end

return TweenService
