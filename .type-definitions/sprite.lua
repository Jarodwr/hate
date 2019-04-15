---@class Sprite
local class = {}

---@public
---@overload fun(transform:Transform):void
---@param x number @The position to draw the object (x-axis).
---@param y number @The position to draw the object (y-axis).
---@param r number @Orientation (radians).
---@param sx number @Scale factor (x-axis). Can be negative.
---@param sy number @Scale factor (y-axis). Can be negative.
---@param ox number @Origin offset (x-axis). (A value of 20 would effectively move your drawable object 20 pixels to the left.)
---@param oy number @Origin offset (y-axis). (A value of 20 would effectively move your drawable object 20 pixels up.)
---@param kx number @Shearing factor (x-axis).
---@param ky number @Shearing factor (y-axis).
---@return void
function class:draw(x, y, r, sx, sy, ox, oy, kx, ky) end