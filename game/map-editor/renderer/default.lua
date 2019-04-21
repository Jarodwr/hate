local DefaultRenderer = extends "game.map-editor.renderer.abstract-renderer"

local AssetService = require "core.service.asset"
local InputService = require "core.service.input"

local LayoutService = require "game.map-editor.service.layout"

--[[
	--TODO: CAP THE OFFSET TO PREVENT THE IMAGE FROM GOING TOO FAR OFF SCREEN
	--TODO: RESET OFFSET BUTTON
	--TODO: CAPTURE SOME MOUSE MOVEMENT EVENTS
	--TODO: SCROLL TO ZOOM
	--TODO: RESET ZOOM
]]

function DefaultRenderer:new()
	self.asset_service = inject(AssetService)
	self.input_service = inject(InputService)
	self.layout_service = inject(LayoutService)

	self.map = self.asset_service:image("image", "dawnblocker", "brick", "lg", "1")
	self.__offset_x, self.__offset_y = 0, 0
end

function DefaultRenderer:update(dt)
	if self.input_service:down("action") then
		local move_x, move_y = self.input_service:mouse_delta()
		self.__offset_x = self.__offset_x + move_x
		self.__offset_y = self.__offset_y + move_y
	end
end

function DefaultRenderer:draw()
	love.graphics.push()

	local ui_width = self.layout_service:vh() * 90 + self.layout_service:padding() * 4
	local remaining_width = self.layout_service:vw() * 100 - ui_width

	local center_pos_x = ui_width + remaining_width / 2
	local center_pos_y = self.layout_service:vh() * 50
	-- by default, offset to the center position of the right area initially
	love.graphics.translate(center_pos_x, center_pos_y)
	love.graphics.translate(self.__offset_x, self.__offset_y)

	self.map:draw()

	love.graphics.pop()
end

return DefaultRenderer
