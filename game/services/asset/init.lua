local cargo = library "cargo"
local cd = (...) .. "."

local image_loader = require(cd .. "loader.image")

return function()
	local manager =
		cargo.init(
		{
			dir = "asset",
			loaders = {
				jpg = image_loader,
				png = image_loader
			},
			processors = {}
		}
	)

	local function default_asset_getter(...)
		local asset = manager
		for _, path in ipairs {...} do
			asset = asset[path]
		end
		return asset
	end

	return "asset", {
		image = function(...)
			local asset = manager
			for _, path in ipairs {...} do
				asset = asset[path]
			end
			assert(asset.draw, "incorrect path to asset")
			return asset
		end,
		audio = default_asset_getter
	}
end
