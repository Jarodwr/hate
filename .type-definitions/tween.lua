---@alias EaseType string | "'linear'" | "'quadin'" | "'quadout'" | "'quadinout'" | "'cubicin'" | "'cubicout'" | "'cubicinout'" | "'quartin'" | "'quartout'" | "'quartinout'" | "'quintin'" | "'quintout'" | "'quintinout'" | "'expoin'" | "'expoout'" | "'expoinout'" | "'sinein'" | "'sineout'" | "'sineinout'" | "'circin'" | "'circout'" | "'circinout'" | "'backin'" | "'backout'" | "'backinout'" | "'elasticin'" | "'elasticout'" | "'elasticinout'"

---@class Tween
local class = {}
---@param type EaseType
---@return Tween
function class:ease(type) end
---@param time number
---@return Tween
function class:delay(time) end
---@param fn fun():void
---@return Tween
function class:onstart(fn) end
---@param fn fun():void
---@return Tween
function class:onupdate(fn) end
---@param fn fun():void
---@return Tween
function class:oncomplete(fn) end
---@param object table
---@param time number
---@param vars table
---@return Tween
function class:after(object, time, vars) end
---@return void
function class:stop() end