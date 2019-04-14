---@class RecurTimer
local RecurTimer = {}
---@return void
function RecurTimer:stop() end

---@class DelayTimer : RecurTimer
local DelayTimer = {}
---@param fn fun():void
---@param delay number
---@return DelayTimer
function DelayTimer:after(fn, delay) end