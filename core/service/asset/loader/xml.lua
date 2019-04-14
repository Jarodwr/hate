local xml2lua = library "xml2lua"
local handler = require "library.xml2lua.xmlhandler.tree"
local lfread = love.filesystem.read

local function xml_loader(path)
	local xml_string, size = lfread(path)
	local handler_instance = handler:new()
	-- Parse the spritesheet file into the handler
	local parser = xml2lua.parser(handler_instance)
	
	parser:parse(xml_string)
	
	return handler_instance
end

return xml_loader
