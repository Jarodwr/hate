local windows = require("tools").windows

return function()
	if imgui.BeginMainMenuBar() then
		if imgui.BeginMenu "File" then
			imgui.MenuItem "Test"
			imgui.EndMenu "File"
		end
		if imgui.MenuItem "State" then
			windows.state.enabled = not windows.state.enabled
		end
		imgui.EndMainMenuBar()
	end
end
