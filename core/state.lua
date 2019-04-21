-- creating locals for luajit performance
local table_insert, table_remove = table.insert, table.remove
local getmetatable, setmetatable = getmetatable, setmetatable
local pairs, ipairs = pairs, ipairs

local state = {}

local __services = {}

-- Create a new stack when an undefined stack is requested
local function create_stack(self, key)
	self[key] = {}
	return self[key]
end

local __stack = {}
local __stacks = setmetatable({default = __stack}, {__index = create_stack})

function state.service(class_type)
	local current = __stack[#__stack]
	return __services[current][class_type]
end

function state.action(name, ...)
	local current = __stack[#__stack]

	-- Call everything in the services
	local pre_action = "pre_" .. name
	for _, service in ipairs(__services[current]) do
		local callbacks = service:get_callbacks()
		if callbacks["pre_action"] then
			callbacks["pre_action"](service, ...)
		end
		if (callbacks[pre_action]) then
			callbacks[pre_action](service, ...)
		end
	end

	current[name](current, name, ...) -- Send the action to the scene

	local post_action = "post_" .. name
	for _, service in ipairs(__services[current]) do
		local callbacks = service:get_callbacks()
		if callbacks[post_action] then
			callbacks[post_action](service, ...)
		end
		if callbacks["post_action"] then
			callbacks["post_action"](service, ...)
		end
	end
end

-- Push a state to the top of the current stack and initialize it
function state.push(scene)
	local services = {}
	--initialize services
	local scene_class = scene
	--Initialize all of the services in base classes as well
	while scene_class ~= nil do
		for service_class, configuration in pairs(scene_class.services or {}) do
			local service = service_class(configuration)
			services[service_class] = service
			-- Used for iteration
			table_insert(services, service)
		end
		scene_class = getmetatable(scene_class)
	end

	local instance = setmetatable({}, scene)
	__services[instance] = services

	-- Insert the scene into the scene stack
	table_insert(__stack, instance)

	-- Construct the scene
	instance:new()

	-- Set off all of the on init events in the services so that we can actually inject services
	for _, service in ipairs(services) do
		local callbacks = service:get_callbacks()
		if callbacks["on_init"] then
			callbacks["on_init"](service)
		end
	end
end

-- Remove the state at the top of the state
function state.pop()
	state.action("destruct")
	local popped_scene = table_remove(__stack)
	__services[popped_scene] = nil
end

-- replace the scene at the top of the stack with the new scene
function state.change(scene)
	state.pop()
	state.push(scene)
end

-- Changes the stack, optionally add a state
function state.stack(name, scene)
	__stack = __stacks[name]
	if scene then
		state.push(scene)
	end
end

-- Resets all stacks and rebases to state
function state.reset(scene)
	for stack_name, _ in pairs(__stacks) do
		state.stack(stack_name)
		while #__stack ~= 0 do
			state.pop()
		end
	end
	__stacks = {default = {}}
	state.push(scene)
end

---@return Scene, Service[]
function state.get()
	local current = __stack[#__stack]
	return current, __services[current]
end

return state
