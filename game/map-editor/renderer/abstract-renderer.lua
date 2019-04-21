local AbstractRenderer = extends "object"

function AbstractRenderer:draw()
	error "NYI"
end

function AbstractRenderer:reset_offset()
	self.__offset_x, self.__offset_y = 0, 0
end

return AbstractRenderer