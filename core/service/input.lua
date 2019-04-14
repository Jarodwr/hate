local baton = library "baton"

local InputService = extends "object"

function InputService:new(mapping)
	self.__baton = baton.new(mapping)
end

function InputService:get(...)
	return self.__baton:get(...)
end

function InputService:down(...)
	return self.__baton:down(...)
end

function InputService:pressed(...)
	return self.__baton:pressed(...)
end

function InputService:released(...)
	return self.__baton:released(...)
end

local Callbacks = {}

function Callbacks:pre_update(dt)
	self.__baton:update(dt)
end

InputService.__callbacks = Callbacks

return InputService