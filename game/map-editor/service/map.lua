local MapService = extends "core.service"

local redux = library "lua-redux"
local immutable = require "utility.immutable"

local function default_reducer(state)
	return state
end

function MapService:new()
	self.__store = redux.createStore(default_reducer)

	-- make this store return an immutable object just for development
	local old_get_state_fn = self.__store.getState
	self.__store.getState = function()
		return immutable(old_get_state_fn())
	end

	self.__history = {}
end

function MapService:dispatch(action)
	self.__store.dispatch(action)
end

function MapService:undo()

end

function MapService:redo()

end

return MapService
