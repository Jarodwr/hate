for _, initialization_fn in ipairs {"config", "globals", "log", "scene", "debug"} do
	require((...) .. "." .. initialization_fn)
end