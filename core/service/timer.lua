local tick = library "tick"

---@class TimerService
local TimerService = extends "core.service"

---@private
function TimerService:new()
	self.__group = tick.group()
end

---@param fn fun():void
---@param delay number
---@return DelayTimer
function TimerService:delay(fn, delay)
	return self.__group:delay(fn, delay)
end

---@param fn fun():void
---@param delay number
---@return RecurTimer
function TimerService:recur(fn, delay)
	return self.__group:recur(fn, delay)
end

local Callbacks = {}

function Callbacks:pre_update(dt)
	return self.__group:update(dt)
end

function TimerService:get_callbacks()
	return Callbacks
end

return TimerService
