--Initialize globals
for k, v in pairs(config.globals) do
	_G[k] = require(v)
end