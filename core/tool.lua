---@class Tool Abstract tools class for drawing and initializing imgui tools
local Tool = extends "object"

function Tool:__call(ref)
  local obj = setmetatable({}, self)
	-- Tool is initialized
	obj.__initialized = true
	-- Reference to this object
	obj.__ref = ref
	-- Window for this object is visible
	obj.__visible = false
	obj:new()
  return obj
end

-- Check that the tool instance has been initialized
function Tool:initialized()
	return self.__initialized
end

-- Getter for the reference to the object
function Tool:ref()
	return self.__ref
end

-- imgui draw function, draw the tools
function Tool:draw()
	error "NYI"
end

return Tool