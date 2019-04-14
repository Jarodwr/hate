local menubar = require("core.tools.menubar")

local showTestWindow = false
local floatValue = 0
local sliderFloat = {0.1, 0.5}
local comboSelection = 1
local textValue = "text"

return function()
	love.graphics.clear(0.2, 0.2, 0.2)
	-- Menu
	menubar()
	-- Windows
	if imgui.Button("Test Window") then
		showTestWindow = not showTestWindow
	end

	if showTestWindow then
		showTestWindow = imgui.ShowDemoWindow(true)
	end

	-- for name, window in pairs(requiretools.window) do
	-- 	if window.enabled then
	-- 		imgui.Begin(name)
	-- 		window:draw()
	-- 		imgui.End(name)
	-- 	end
	-- end
end
