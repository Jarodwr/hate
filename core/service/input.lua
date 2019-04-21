local baton = library "baton"
---@class InputService
local InputService = extends "core.service"

---@private
function InputService:new(mapping)
	self.__baton = baton.new(mapping)

	self.__previous_mouse_position = {x = 0, y = 0}
	self.__mouse_delta = {x = 0, y = 0}
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

---@return number, number
function InputService:mouse_delta()
	return self.__mouse_delta.x, self.__mouse_delta.y
end

local Callbacks = {}

function Callbacks:pre_update(dt)
	self.__baton:update(dt)

	--Mouse position updates
	local current_x, current_y = love.mouse.getX(), love.mouse.getY()
	self.__mouse_delta = {
		x = current_x - self.__previous_mouse_position.x,
		y = current_y - self.__previous_mouse_position.y
	}
	self.__previous_mouse_position = {
		x = current_x,
		y = current_y
	}
end

function InputService:get_callbacks()
	return Callbacks
end

return InputService
