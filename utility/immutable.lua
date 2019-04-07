local function access_error(tbl, index)
	error("Attempted to set index: " .. index)
end

local function make_immutable(tbl)
	assert(type(tbl) == "table", "can only make tables immutable")
	return setmetatable(
		{},
		{
			__index = function(self, index)
				local value = tbl[index]
				if type(value) == 'table' then
					return make_immutable(value)
				else
					return value
				end
			end,
			__newindex = access_error
		}
	)
end

return make_immutable
