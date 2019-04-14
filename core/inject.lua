local state = require "core.state"

local function inject(service_class)
	return state.service(service_class)
end

return inject