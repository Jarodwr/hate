--[[
	Allows for the deep copying of recursive tables
	value is the subject of the copying
	index is the stored index of all tables that have been copied already, this stops recursive tables from copying forever
]]--
local function recursive_copy(value, index)
	local obj_type = type(value)
	local copy
	if obj_type == "table" then
		copy = index[value]
		if not copy then
			copy = {}
			for k, v in pairs(value) do
				copy[recursive_copy(k, index)] = recursive_copy(v, index)
			end
			index[value] = copy
			setmetatable(copy, recursive_copy(getmetatable(value), index))
		end
	else
		copy = value
	end
	return copy
end

return function(object)
	return recursive_copy(object, {})
end