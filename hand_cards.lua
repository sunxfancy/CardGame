
-- 线性运动函数
function linear_change (arg, target, deta)
    if math.abs(arg - target) < deta then
        return target
    end
    if arg < target then
        return arg + deta
    else
        return arg - deta
    end
end

function gaussian (x)
    local ans = math.exp(-x*x*0.0001)
    if (ans < 0.01)  then ans = 0 end
    return ans
end



local HandSprite = {
}

function HandSprite:new (card)
    obj = {x = 0, y = 0, w = 360, h = 505, size = 0.5}
    setmetatable(obj, {__index = self})
    obj.card = card
    return obj
end

function HandSprite:draw (dt)
    -- 注意：绘图原点在卡的下边中点
    love.graphics.draw(self.card:paint(), self.x, self.y, 0, self.size, self.size, self.w/2, self.h)
end

function HandSprite:update (dt)
    if (self.ox ~= nil and self.ox ~= self.x) then
        self.x = linear_change(self.x, self.ox, dt*300); -- 300px/s
    end
    if (self.osize ~= nil and self.osize ~= self.size) then
        self.size = linear_change(self.size, self.osize, dt*2); -- 300px/s
    end
end


local HandCards = {
}

function HandCards:new (obj)
    obj = obj or {}
    setmetatable(obj, {__index = self})
    obj.focus = nil
    obj.cards = {}
    return obj
end

function HandCards:insert (card)
    card = HandSprite:new(card)
    card.y = self.h
    table.insert(self.cards, card)
end

function HandCards:getWidth ()
    local sum = 0
    for i, v in pairs(self.cards) do
        sum = sum + v.w * 0.5 +20
    end
    return sum
end

function HandCards:update (dt)
    -- 缩放布局
    for i, v in pairs(self.cards) do
        if self.focus ~= nil then
            v.osize = 0.5 + 0.2 * gaussian(v.x - self.focus)
        else
            v.osize = 0.5
        end
    end

    -- 横向布局
    local sum = self:getWidth()
    local begin = 0
    if (sum < self.w) then
        begin = (self.w - sum) / 2
    end
    for i, v in pairs(self.cards) do
        v.ox = begin
        begin = begin + v.w * 0.5 +20
    end

    -- 更新动画
    for i, v in pairs(self.cards) do
        v:update(dt)
    end
end


function HandCards:draw (dt)
    for i, v in pairs(self.cards) do
        v:draw(dt)
    end
end

function HandCards:inRect (x, y)
    x = math.abs(x - self.x - self.w/2)
    y = math.abs(y - self.y - self.h/2)
    return x < self.w/2 and y < self.h/2
end

function HandCards:mousepressed (x, y, btn, istouch)

end

function HandCards:mousereleased (x, y, btn, istouch)

end

function HandCards:mousemoved (x, y, dx, dy, istouch)
    if (self:inRect(x, y)) then
        self.focus = x
    else
        self.focus = nil
    end
end


return HandCards
