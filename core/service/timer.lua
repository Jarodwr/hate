local tick = library "tick"

local TimerService = extends "object"

function TimerService:new()
	self.__group = tick.group()
end

function TimerService:delay(...)
	return self.__group:delay(...)
end

function TimerService:recur(...)
	return self.__group:recur(...)
end

local Callbacks = {}

function Callbacks:pre_update(dt)
	return self.__group:update(dt)
end

TimerService.__callbacks = Callbacks

return TimerService