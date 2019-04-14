local state = require "core.state"

local SceneService = extends "object"

function SceneService:__error_on_overqueuing()
	assert(
		self.queued ~= nil,
		"Do not queue multiple scenes at once, it's bad practice and will make stuff more confusing in the long run"
	)
end

function SceneService:pop()
	self:__error_on_overqueuing()
	self.queued = {action = "pop"}
end

function SceneService:push(scene)
	self:__error_on_overqueuing()
	self.queued = {action = "push", scene = scene}
end

function SceneService:change(scene)
	self:__error_on_overqueuing()
	self.queued = {action = "change", scene = scene}
end

function SceneService:stack(name)
	self:__error_on_overqueuing()
	self.queued = {action = "stack", name = name}
end

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

SceneService.__callbacks = Callbacks

return SceneService
