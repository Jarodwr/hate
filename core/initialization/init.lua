for _, initialization_fn in ipairs {"config", "globals", "log", "hate", "debug"} do
	require((...) .. "." .. initialization_fn)
end