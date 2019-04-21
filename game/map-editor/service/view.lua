local ViewService = extends "core.service"

function ViewService:new()
	self.__zoom_value = 1
	self.__zoom_step = 0.25
end

function ViewService:get_zoom()
	return self.__zoom_value
end

function ViewService:set_zoom(value)
	self.__zoom_value = value
end

function ViewService:get_zoom_levels()
	return {0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2.0}
end

function ViewService:zoom_in()
	self:set_zoom(self:get_zoom() + self.__zoom_step)
end

function ViewService:zoom_out()
	self:set_zoom(self:get_zoom() - self.__zoom_step)
end

function ViewService:reset_position()
	error "NYI"
end

return ViewService