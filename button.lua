
local Button = {}

function Button.new (obj)
    local o = obj or {}
    setmetatable(o, Button)
    o.__index = Button
    return o
end

function Button:draw ()

end

function Button:update()

end

function Button:inCircle(x, y)
    local r = self.w/2
    local mx, my = self.x + self.w/2, self.y + self.h/2
    if (x^2 + y^2 < r^2) then
        return true
    end
    return false
end

function Button:inRect (x, y)
    local bx, by = self.x, self.y
    local ex, ey = self.x + self.w, self.y + self.h
    return bx < x and x < ex and
           by < y and y < e
end

function Button:onClick (e)

end
