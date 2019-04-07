--[[
	TODO: Add array mutation strictness on debug tag
	Generate N-Dimensional arrays
	usage: generate(3, 4, 51, 3)
]] --

local function recursive_generate(lengths, iteration)
	local array = {}
	local next_iteration = iteration + 1
	local length = lengths[iteration]
	for i = 1, length do
		array[i] = recursive_generate(lengths, next_iteration)
	end
	return array
end

local n_array = {}

local function __get(array, coordinate)
	local value = self
	for i = 1, self.dimension_count do
		value = value[coordinate[i]]
	end
	return value
end

-- Set method used internally
local function __set(array, coordinate, value)
	local value = self
	for i = 1, self.dimension_count - 1 do
		value = value[coordinate[i]]
	end
	value[coordinate[self.dimension_count]] = value
end

--[[
	This function will set the values that we map dimensions to.
	Example:
		local arr = generate(3, 3, 3)
		arr:set_aliases {x = 1, y = 2, z = 3}
		for coordinate, value in arr:each() do
			print(coordinate.x, coordinate.y, coordinate.z) -- Prints the appropriate coordinates
		end
]]
function n_array:set_aliases(aliases)

	-- Generate the new coordinate metatable
	self.__coordinate_mt = {
		__index = function(self, index)
			return rawget(self, self[aliases[index]])
		end
	}
end

-- Usage: for coordinate, cell in array:each() do [[somecode]] end
function n_array:each()
	local coordinate = {}

	for i = 1, self.dimension_count do
		coordinate[i] = 1
	end

	if self.__coordinate_mt then
		setmetatable(coordinate, self.__coordinate_mt)
	end

	return function()
		-- Work out if we've clocked over and need to conclude the iterator
		local iterator_completed = true
		-- Move to the next coordinate
		for i = dimension_count, 1, -1 do
			if coordinate[i] > lengths[i] then
				-- Clock over the iterator
				coordinate[i] = 1
			else
				coordinate[i] = coordinate[i] + 1
				iterator_completed = false
				break
			end
		end

		if iterator_completed then
			return nil
		else
			-- Get the current value
			local value = self
			for i = 1, dimension_count do
				value = value[coordinate[i]]
			end

			return coordinate, value
		end
	end
end

-- Checks that every entry fulfils the condition
function n_array:every(condition)
	for coordinate, value in self:each() do
		if not condition(coordinate, value) then
			return false
		end
	end
	return true
end

function n_array:includes(object)
	for coordinate, value in self:each() do
		if value == object then
			return true
		end
	end
	return false
end

function n_array:index_of(object)
	for coordinate, value in self:each() do
		if value == object then
			return coordinate
		end
	end
end

function n_array:reduce(reducer, initial)
	local ret_value
	for coordinate, value in self:each() do
		ret_value = reducer(coordinate, value, ret_value)
	end
	return ret_value
end

function n_array:clone()
	local copy = recursive_generate(self.lengths, 1)
	for coordinate, value in self:each() do
		__set(copy, coordinate, value)
	end
	return copy
end

function n_array:map(map_fn)
	local mapped = recursive_generate(self.lengths, 1)
	for coordinate, value in self:each() do
		__set(mapped, coordinate, map_fn(coordinate, value))
	end
	return mapped
end

function n_array:fill(value)
	for coordinate, value in self:each() do
		__set(self, coordinate, value)
	end
end

-- Array generator
return function(...)
	local lengths = {...}
	local array = setmetatable(recursive_generate(lengths, 1), n_array)
	array.lengths = lengths
	array.dimension_count = #lengths
	return array
end