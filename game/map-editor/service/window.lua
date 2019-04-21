---@class WindowService manages drawing all context free menus
local WindowService = extends "core.service"

function WindowService:new()
	self.windows = {}
end

---@param title any
function WindowService:open_window(title, window)
	self.windows[title] = window
end

---@param title any
function WindowService:close_window(title)
	self.windows[title] = nil
end

---@return boolean
function WindowService:is_open(title)
	return self.windows[title] ~= nil
end

function WindowService:draw_windows()
	for title, window in pairs(self.windows) do
		window:draw()
	end
end

return WindowService
