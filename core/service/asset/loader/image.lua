-- Initialize
local draw = love.graphics.draw
local newQuad = love.graphics.newQuad
local newImage = love.graphics.newImage

local xml_loader = require((...):match("(.-)[^%/%.]+$") .. "xml")
--[[
	Q:	What is the purpose of creating this interface for drawing sprites?
  A:	It's because at some point I want to create a backend that draws
			all images to a canvas so that we can batch more consistently
]]
local sprite_mt = {}

sprite_mt.__index = {}

function sprite_mt.__index:draw(...)
	draw(self.image, self.quad, ...)
end

local function newSprite(image, quad)
	local instance = {}
	instance.image = image
	instance.quad = quad or newQuad(0, 0, sw, sh, sw, sh)
	return setmetatable(instance, sprite_mt)
end

-- Recursive spritesheet parsing function
local function parse_sheet(image, sw, sh, node)
	local collection = {}

	if node.quad then
		for _, quad in ipairs(node.quad) do
			collection[quad._attr.key] =
				newSprite(image, newQuad(quad._attr.x, quad._attr.y, quad._attr.w, quad._attr.h, sw, sh))
		end
	end

	if node.group then
		for _, group in ipairs(node.group) do
			collection[group._attr.key] = parse_sheet(image, sw, sh, group)
		end
	end

	return collection
end

local function image_loader(path)
	local image = newImage(path)
	local sw, sh = image:getWidth(), image:getHeight()
	local spritesheet_xml = xml_loader(path:match("(.-)[^%/%.]+$") .. "xml")
	if spritesheet_xml then
		-- Return a table of sprite groups and sprites
		return parse_sheet(image, sw, sh, spritesheet_xml.root.quad_definitions)
	else
		-- Return a default sprite with a quad that covers the whole image
		return newSprite(image, newQuad(0, 0, sw, sh, sw, sh))
	end
end

return image_loader
