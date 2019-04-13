require "imgui"

-- Initialize the tools state
-- local tools_state = {windows = require("tools.window")()}

local main = {} -- Store original callbacks
for k, v in ipairs(require("core.callbacks")) do
	main[v] = love[v] or function()
		end
end

local debugMode = false

----------------------------
-- Wrapped LOVE callbacks --
----------------------------
function love.update(dt)
	main.update(dt)
	if debugMode then
		imgui.NewFrame()
	end
end

function love.draw()
	main.draw()
	if debugMode then
		require("core.tools.main")()
		imgui.Render()
	end
end

function love.quit()
	imgui.ShutDown()
	main.quit()
end

--------------------------
-- User input callbacks --
--------------------------
function love.textinput(t, ...)
	imgui.TextInput(t)
	if not imgui.GetWantCaptureKeyboard() then
		-- Pass event to the game
		main.textinput(t, ...)
	end
end

function love.keypressed(key, ...)
	if key == config.debugKey then
		debugMode = not debugMode
	end
	imgui.KeyPressed(key)
	if not imgui.GetWantCaptureKeyboard() then
		-- Pass event to the game
		main.keypressed(key, ...)
	end
end

function love.keyreleased(key, ...)
	imgui.KeyReleased(key)
	if not imgui.GetWantCaptureKeyboard() then
		-- Pass event to the game
		main.keyreleased(key, ...)
	end
end

function love.mousemoved(x, y, ...)
	imgui.MouseMoved(x, y)
	if not imgui.GetWantCaptureMouse() then
		-- Pass event to the game
		main.mousemoved(x, y, ...)
	end
end

function love.mousepressed(x, y, button, ...)
	imgui.MousePressed(button)
	if not imgui.GetWantCaptureMouse() then
		-- Pass event to the game
		main.mousepressed(x, y, button, ...)
	end
end

function love.mousereleased(x, y, button, ...)
	imgui.MouseReleased(button)
	if not imgui.GetWantCaptureMouse() then
		-- Pass event to the game
		main.mousereleased(x, y, button, ...)
	end
end

function love.wheelmoved(x, y, ...)
	imgui.WheelMoved(y)
	if not imgui.GetWantCaptureMouse() then
		-- Pass event to the game
		main.wheelmoved(x, y, ...)
	end
end

-- Access state as module
local tools_state = {windows = {}}
local window_directory = "core.tools.window"
for _, name in ipairs({"state"}) do
	tools_state.windows[name] = require(window_directory .. "." .. name)()
end

return tools_state -- Access as a module
