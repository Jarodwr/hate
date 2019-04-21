local LayoutService = extends "core.service"

local getWindowHeight, getWindowWidth = love.graphics.getHeight, love.graphics.getWidth

function LayoutService:new()
	self.__global_configuration = "set"
	self.__padding = 10
	self:__update_units()
end

function LayoutService:get_global_configuration()
	return self.__global_configuration
end

function LayoutService:set_global_configuration(new_configuration)
	self.__global_configuration = new_configuration
end

---@return number
function LayoutService:vh()
	return self.__vh
end

---@return number
function LayoutService:vw()
	return self.__vw
end

function LayoutService:padding()
	return self.__padding
end

function LayoutService:__update_units()
	self.__vh = getWindowHeight() / 100
	self.__vw = getWindowWidth() / 100
end

local Callbacks = {}

function Callbacks:pre_draw()
	self:__update_units()
end

function LayoutService:get_callbacks()
	return Callbacks
end

return LayoutService
