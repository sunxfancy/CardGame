
local Button = {}


function Button.new (obj)
    local o = obj or {}
    setmetatable(o, Button)
    o.__index = Button
    return o
end
