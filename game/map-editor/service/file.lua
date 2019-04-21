local FileService = extends "core.service"

function FileService:new()
	self.__current_file = nil
	self.__open_files = {}
	--TODO: generate list of recent files from some sort of cache
	self.__recent_files = {}
end

function FileService:open_file(path)
	error "NYI"
end

function FileService:current_file()
	return self.__current_file
end

function FileService:open_files()
	return self.__open_files
end

function FileService:select_file(name)
	error "NYI"
end

function FileService:recent_files()
	return self.__recent_files
end

function FileService:new_file(path)
	if path == nil then
		error "NYI"
	else
		error "NYI"
	end
end

function FileService:open_file(path)
end

function FileService:save_file(path)
	if path == nil then
		error "NYI"
	else
		error "NYI"
	end
end

function FileService:save_file_as(path)
	if path == nil then
		error "NYI"
	else
		error "NYI"
	end
end

return FileService
