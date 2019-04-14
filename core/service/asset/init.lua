local cd = (...) .. "."

local cargo = library "cargo"
local image_loader = require(cd .. "loader.image")

local ipairs, assert = ipairs, assert

local AssetService = extends "object"

function AssetService:new()
	self.__manager = cargo.init {
		dir = "asset",
		loaders = {
			jpg = image_loader,
			png = image_loader
		},
		processors = {}
	}
end

function AssetService:image(...)
	local asset = self.__manager
	for _, path in ipairs {...} do
		asset = asset[path]
	end
	assert(asset.draw, "incorrect path to asset")
	return asset
end

function AssetService:audio(...)
	local asset = self.__manager
	for _, path in ipairs {...} do
		asset = asset[path]
	end
	return asset
end

return AssetService