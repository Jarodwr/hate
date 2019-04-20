-- Only set the log settings if a logger is defined
if log then
	--Set log settings
	log.usecolor = config.logging.usecolor
	log.outfile =
		config.logging.directory ..
		"/" ..
			(config.logging.datetime and os.date "%Y-%m-%d %H-%M-%S" or "") ..
				((config.logging.filename) and ("." .. config.logging.filename) or "") .. "." .. config.logging.extension
	log.level = config.logging.level
end
