local hate = {} -- Collect all scene related helpers into this one variable

hate.state = {}

-- Internally used to initialize new scenes properly
local function initialize(class, ...)
	local instance = class(...)
	instance.__services = {}

	--initialize services
	for _, initializer in ipairs(class.services) do
		local name, service = initializer()
		instance.__services[name] = service
		-- Used for iteration
		table.insert(instance.__services, service)
	end

	return instance
end

-- Create a new stack when an undefined stack is requested
local function create_stack(self, key)
	self[key] = {}
	return self[key]
end

local __stack = {}
local __stacks = setmetatable({default = __stack}, {__index = create_stack})

function hate.state.action(name, ...)
	local current = __stack[#__stack]

	-- Call everything in the services
	for _, service in ipairs(current.__services) do
		local callbacks = getmetatable(service).__callbacks
		if (callbacks[name]) then
			callbacks[name](...)
		end
	end

	current[name](current, name, ...) -- Send the action to the scene
end

-- Push a state to the top of the current stack and initialize it
function hate.state.push(scene, ...)
	table.insert(__stack, initialize(scene, ...))
end

-- Remove the state at the top of the state
function hate.state.pop()
	table.remove(__stack)
end

-- replace the scene at the top of the stack with the new scene
function hate.state.change(scene, ...)
	__stack[#__stack] = initialize(scene, ...)
end

-- Changes the stack, optionally add a state
function hate.state.stack(name, scene, ...)
	__stack = __stacks[name]
	if scene then
		table.insert(__stack, initialize(scene, ...))
	end
end

-- Resets all stacks and rebases to state
function hate.state.reset(scene, ...)
	__stacks = {default = {initialize(scene, ...)}}
end

setmetatable(
	hate,
	{
		__index = function(self, key)
			local service = __stack[#__stack].__services[key]
			assert(service, "service requested does not exist")
			return service
		end,
		__newindex = function(self, key, value)
			error "initialize services properly, don't add them to hate directly"
		end
	}
)

return hate
