---@class Tool : Object Abstract tools class for drawing and initializing imgui tools
local Tool = extends "object"

---@generic T
---@param ref T @This is a reference to the object that the tool is attached to, access with self:ref() for convenience
function Tool:__call(ref)
	local obj = setmetatable({}, self)
	-- Tool is initialized
	obj.__initialized = true
	-- Reference to this object
	obj.__ref = ref
	-- Window for this object is visible
	obj.__window_visibility = false
	obj:new()
  return obj
end

-- Check that the tool instance has been initialized
function Tool:initialized()
	return self.__initialized
end

---@return boolean The current visibility status of the window
function Tool:get_window_visibility()
	return self.__window_visibility
end

---@return boolean The current visibility status of the window
function Tool:toggle_window()
	self.__window_visibility = not self.__window_visibility
	return self.__window_visibility
end

---@param value boolean
function Tool:set_window_visibility(value)
	self.__window_visibility = value
end

-- Getter for the reference to the object
function Tool:ref()
	return self.__ref
end

-- imgui draw function, draw the tools
---@return void
function Tool:draw()
	error "NYI"
end

---@return boolean
function Tool:hidden()
	return false
end

return Tool