local state = require "core.state"

local SceneService = extends "object"

function SceneService:pop()
	self.queued = {action = "pop"}
end

function SceneService:push(scene)
	self.queued = {action = "push", scene = scene}
end

function SceneService:change(scene)
	self.queued = {action = "change", scene = scene}
end

function SceneService:stack(name)
	self.queued = {action = "stack", name = name}
end

function SceneService:reset()
	self.queued = {action = "reset"}
end

SceneService.callbacks = {
	post_action = function()
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
}

return SceneService
