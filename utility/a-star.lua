--USE THIS: https://medium.com/@nicholas.w.swift/easy-a-star-pathfinding-7e6689c7f7b2

-- @param array | the array we are searching
-- @param array_values | the values of each array entry in a map 
-- @param value	| the value we are searching for
local function binary_search(array, array_values, value)
	local floor, roof = 1, #array

	local left = 0

	local midpoint
	while floor <= roof do
		midpoint = math.floor((floor + roof) / 2)
		-- Need to make sure this sorts properly
		if value > array_values[array[midpoint]] then
			roof = midpoint - 1
			left = 0
		else
			floor = midpoint + 1
			left = 1
		end
	end
	return midpoint + left
end

local function naive_search(array, value)
	for i = 1, #array do
		if array[i] == value then
			return i
		end
	end
end
--signature: next_nodes_function()
--signature: heuristic_function()
--signature: cost_function()

local function astar(start_node, end_node, neighbours_fn, heuristic_fn, cost_fn)
	local open_list = {} -- Order this list by f_value

	local parent = {} -- Stores the parent of a node
	local closed = {} -- Flags whether the node has already been closed
	local f = {} -- Cost to get to this node + heuristic cost
	local g = {} -- Cost to get to this node
	local h = {} -- Heuristic cost of this node

	--Add the start node
	table.insert(open_list, start_node)
	f[start_node] = 0

	--Loop until you find the end
	while #open_list > 0 do
		--Get the current node by popping the list
		local current_node = table.remove(open_list)
		closed[current_node] = true
		-- Check if the current node is the target
		if current_node == end_node then
		-- Backtrack to get path
		end
		-- Get all neighbour nodes
		for _, neighbour_node in ipairs(neighbours_fn(current_node)) do
			-- Check if the neighbour node is already in the closed list
			if not closed[neighbour_node] then
				--Calculate all values for this neighbour node
				local neighbour_g = g[current_node] + cost_fn(current_node, neighbour_node)
				local neighbour_h = heuristic_fn(neighbour_node)
				local neighbour_f = neighbour_g + neighbour_h
				--	Do not add the neighbour to the open list if:
				--	1. The neighbour is already in the open list
				--	2. AND the total calculated cost to get to the neighbour in the open list is lower than the one we've just calculated
				local neighbour_position = naive_search(open_list, neighbour_node)
				local insert_neighbour = true
				if neighbour_position ~= nil then
					if g[neighbour_node] > neighbour_g then
						table.remove(open_list, neighbour_position)
					else
						insert_neighbour = false
					end
				end
				if insert_neighbour then
					local insertion_position = binary_search(open_list, f, neighbour_f)
					-- Set the new neighbour values
					f[neighbour_node], g[neighbour_node], h[neighbour_node] = neighbour_f, neighbour_g, neighbour_h
					parent[neighbour_node] = current_node
					table.insert(open_list, neighbour_node, insertion_position)
				end
			end
		end
	end
end

return astar