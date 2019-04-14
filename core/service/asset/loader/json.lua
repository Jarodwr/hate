local json = library "json"
local lfread = love.filesystem.read

local function json_loader(path)
	local json_file, err = lf.read(path)

	if err then
		return json_file, err
	end

	return json.decode(json_file)
end

return json_loader
