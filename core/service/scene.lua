local state = require "core.state"

---@class SceneService
local SceneService = extends "object"

SceneService.__alias = "Scenes"

---@private
function SceneService:__error_on_overqueuing()
	assert(
		self.queued ~= nil,
		"Do not queue multiple scenes at once, it's bad practice and will make stuff more confusing in the long run"
	)
end

---@public
---@return void
function SceneService:pop()
	self:__error_on_overqueuing()
	self.queued = {action = "pop"}
end

---@public
---@param scene_type Scene
---@return void
function SceneService:push(scene_type)
	self:__error_on_overqueuing()
	self.queued = {action = "push", scene = scene_type}
end

---@public
---@param scene_type Scene
---@return void
function SceneService:change(scene_type)
	self:__error_on_overqueuing()
	self.queued = {action = "change", scene = scene_type}
end

---@public
---@param name string
---@return void
function SceneService:stack(name)
	self:__error_on_overqueuing()
	self.queued = {action = "stack", name = name}
end

---@public
---@return void
function SceneService:reset()
	self:__error_on_overqueuing()
	self.queued = {action = "reset"}
end

local Callbacks = {}

function Callbacks:post_action()
	if self.queued then
		if self.queued.action == "pop" then
			state.pop()
		elseif self.queued.action == "push" then
			state.push(self.queued.scene)
		elseif self.queued.action == "change" then
			state.change(self.queued.scene)
		elseif self.queued.action == "stack" then
			state.stack(self.queued.name)
		elseif self.queued.action == "reset" then
			state.stack(self.queued.scene)
		else
			error "INVALID STATE MANAGEMENT ACTION"
		end
		self.queued = nil
	end
end

---@private
SceneService.__callbacks = Callbacks

return SceneService
