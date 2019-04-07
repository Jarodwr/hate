--Configure debug tools
if config.debug then
	require "tools" -- Initialize debug tools
	library "strict" -- Prevent additional global variables from being defined
end