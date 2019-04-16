local ObjectExplorer = extends "object"

local imgui, pairs = imgui, pairs

ObjectExplorer.title = "Object Explorer"

function ObjectExplorer:new(object)
	self.object = object
end

function ObjectExplorer:draw()
	imgui.SetNextWindowSize(200, 200)
	imgui.Begin(self.title)
	for k, v in pairs(self.object) do
	end
	imgui.End()
end

return ObjectExplorer