local baton = library "baton"
---@class InputService
local InputService = extends "core.service"

---@private
function InputService:new(mapping)
	self.__baton = baton.new(mapping)
end

---@param control string
function InputService:get(control)
	return self.__baton:get(control)
end

---@param control string
---@return boolean
function InputService:down(control)
	return self.__baton:down(control)
end

---@param control string
---@return boolean
function InputService:pressed(control)
	return self.__baton:pressed(control)
end

---@param control string
---@return boolean
function InputService:released(control)
	return self.__baton:released(control)
end

local Callbacks = {}

function Callbacks:pre_update(dt)
	self.__baton:update(dt)
end

function InputService:get_callbacks()
	return Callbacks
end

return InputService
