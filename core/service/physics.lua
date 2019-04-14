local bf = library "breezefield"

---@class PhysicsService
local PhysicsService = extends "object"

---@private
function PhysicsService:new()
	self.__world = bf.newWorld(0, 90.81, true)
end

local Callbacks = {}

function Callbacks:destruct()
	-- Make sure the box2d instance is destroyed to allow physics related
	-- stuff from being garbage collected
	self.__world._physworld:destroy()
end

---@private
PhysicsService.__callbacks = Callbacks

return PhysicsService