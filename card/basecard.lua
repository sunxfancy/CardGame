local resources = require "resources"
local basecard = {
    type = "minion",
    cate = "all",
    cost = 0,
    ap = 0,
    hp = 0,
    name = nil
}

function basecard:new(card)
    card = card or {}
    setmetatable(card, {__index = self })
    return card 
end

function basecard:init()
    self.image = resources.getImage(self.name..'.png')
    self.cover = resources.getImage(self.cate..'.png')
    self.isInit = true
end

function basecard:paint(x, y, r)
    if self.isInit == nil then
        self:init()
    end
    love.graphics.draw(self.image, x, y, r)
    love.graphics.draw(self.cover, x, y, r, 0.36)
end

return basecard