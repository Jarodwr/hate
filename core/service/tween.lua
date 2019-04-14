local flux = library "flux"

local TweenService = extends "object"

function TweenService:new()
	self.__group = flux.group()
end

function TweenService:tween(...)
	return self.__group:to(...)
end

local Callbacks = {}

function Callbacks:pre_update(dt)
	self.__group:update(dt)
end

TweenService.__callbacks = Callbacks

return TweenService
