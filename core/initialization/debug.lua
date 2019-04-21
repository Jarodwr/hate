--Configure debug tools
if config.debug then
	library "strict" -- Prevent additional global variables from being defined

	-- #region [rgba(22, 160, 133, 0.2)]
	-- Initialize imgui, we use this to draw all of our tools
	require "imgui"
	local imgui = imgui
	local state = require "core.state"
	-- Initialize the tools state
	-- local tools_state = {windows = require("tools.window")()}

	local main = {} -- Store original callbacks
	for k, v in ipairs(require("core.callbacks")) do
		main[v] = love[v] or function()
			end
	end

	local visible = false

	----------------------------
	-- Wrapped LOVE callbacks --
	----------------------------
	-- function love.update(dt)
	-- 	main.update(dt)
	-- 	if visible then
	-- 	end
	-- end

	function love.draw()
		main.draw()
		if visible then
			imgui.NewFrame()
			local scene = state.get()
			if not scene.__tools:initialized() then
				scene.__tools = scene.__tools(scene)
			end
			scene.__tools:draw()
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
		if key == config.debug.activationkey then
			visible = not visible
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
-- #endregion
end
