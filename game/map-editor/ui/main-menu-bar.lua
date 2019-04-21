local Menubar = extends "object"

function Menubar:new()

end

function Menubar:draw()
	if imgui.BeginMainMenuBar() then
		if imgui.BeginMenu "File" then
			imgui.EndMenu()
		end
		if imgui.BeginMenu "Edit" then
			imgui.EndMenu()
		end
		if imgui.BeginMenu "Maps" then
			imgui.EndMenu()
		end
		if imgui.BeginMenu "Settings" then
			imgui.EndMenu()
		end
		if imgui.Button "Help" then

		end
		imgui.EndMainMenuBar()
	end
end

return Menubar