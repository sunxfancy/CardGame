local resources = require "resources"

local Button = {
    rect = {x = 0, y =0, w = 172, h = 56 },
    image = 'test',
    isCircle = false,
    ext = 'png'
}

-- must passed args {image = "name",  rect = {} }
function Button:new (obj)
    obj = obj or {}
    setmetatable(obj, { __index = self })
    obj.status = 0  -- 0 is normal, 1 is pressed, 2 is hover
    obj.normal, obj.pressed, obj.hover = resources.getButton(obj.image, obj.ext)
    return obj
end

function Button:draw (dt)
    local r = self.rect
    if self.status == 0 then
        love.graphics.draw(self.normal, r.x, r.y)
    elseif self.status == 1 then
        love.graphics.draw(self.pressed, r.x, r.y)
    else
        love.graphics.draw(self.hover, r.x, r.y)
    end
end

function Button:update()

end

function Button:inCircle(x, y)
    local rect = self.rect
    x = x - rect.x - rect.w/2
    y = y - rect.y - rect.h/2
    return (x^2 / (rect.w/2)^2 + y^2 / (rect.h/2)^2 < 1)
end

function Button:inRect (x, y)
    local rect = self.rect
    x = math.abs(x - rect.x - rect.w/2)
    y = math.abs(y - rect.y - rect.h/2)
    return x < rect.w/2 and y < rect.h/2
end

function Button:onClick (e)
end

function Button:onHover (e)
end



function Button:mousepressed(x, y, btn, istouch)
    if (self.isCircle and self:inCircle(x, y)) or
        (not self.isCircle and self:inRect(x, y)) then
        self.status = 1
    end
end


function Button:mousereleased( x, y, btn, istouch )
    if self.status == 1 then
        self.status = 0
        if (self.isCircle and self:inCircle(x, y)) or
            (not self.isCircle and self:inRect(x, y)) then
            self:onClick({x = x, y = y, btn = btn, istouch = istouch})
        end
    end
end


function Button:mousemoved( x, y, dx, dy, istouch )
    if (self.isCircle and self:inCircle(x, y)) or
        (not self.isCircle and self:inRect(x, y)) then
        if self.status == 0 then
            self.status = 2
        end
    else
        if self.status == 2 then
            self.status = 0
        end
    end
end

return Button
