-- Syntactic sugar for OOP behaviour
-- Usage: local NewClassName = extends "path.to.super.class"
return function(class)
	local identifierType = type(class)
	if identifierType == "table" then
		return class:extend()
	elseif identifierType == "string" then
		-- using "library.classic" looks ugly so we're going to hard code "object" to alias to "library.classic"
		if class == "object" then
			return library "classic":extend()
		else
			return require(class):extend()
		end
	end
end