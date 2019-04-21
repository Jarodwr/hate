local EditService = extends "core.service"

function EditService:new()
	self.__current_selection = nil
	self.__clipboard = nil

	-- Used for undoing and redoing
	self.__history = {}
	self.__future = {}
end

function EditService:select(selection)
	self.__current_selection = selection
end

function EditService:deselect()
	self.__current_selection = nil
end

function EditService:copy()
	self.__clipboard = self.__current_selection
end

function EditService:paste()
	error "NYI"
end

function EditService:cut()
	error "NYI"
end

function EditService:undo()
	error "NYI"
end

function EditService:redo()
	error "NYI"
end

return EditService
