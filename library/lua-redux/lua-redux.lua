local folderOfThisFile = (...):match("(.-)[^%/%.]+$")
local connect = require(folderOfThisFile .. 'connect')
local createStore = require(folderOfThisFile .. 'createStore')

return {
  connect = connect,
  createStore = createStore
}