local ServiceExplorer = extends "object"

ServiceExplorer.title = "Service Explorer"

function ServiceExplorer:draw()
	imgui.Begin(self.title)
	imgui.End()
end

return ServiceExplorer