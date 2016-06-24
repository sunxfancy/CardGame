local resources = require "resources"
local basecard = {
    type = "minion",
    cate = "all",
    cost = 0,
    ap = 0,
    hp = 0,
    name = nil,
    describe = ""
}

function basecard:new(card)
    card = card or {}
    setmetatable(card, {__index = self })
    return card
end

function basecard:init()
    self.image = resources.getImage(self.name..'.png') -- size must be 230x308
    self.cover = resources.getImage(self.cate..'.png') -- size must be 360x505
    self.isInit = true
end

local cw, ch, iw, ih = 360, 505, 230, 308

local ff = function ()
    love.graphics.ellipse( 'fill', cw/2, ih/2, iw/2, ih/2 ) -- ellipse size
end

local font = love.graphics.newFont("res/fonts/文泉驿正黑.ttf", 26)

function basecard:paint()
    if self.canvas ~= nil then
        return self.canvas
    end
    if self.isInit == nil then
        self:init()
    end
    local canvas = love.graphics.newCanvas(cw, ch) -- canvas size
    local old_cvs = love.graphics.getCanvas()
    love.graphics.setCanvas(canvas)
    love.graphics.setFont(font)
    love.graphics.stencil(ff, "replace", 1)
    love.graphics.setStencilTest("greater", 0)
    love.graphics.draw(self.image, (cw-iw)/2, 0)
    love.graphics.setStencilTest()
    love.graphics.draw(self.cover, 0, 0)
    love.graphics.printf(self.discribe, 60, ih+20, cw-120)
    love.graphics.setCanvas(old_cvs)
    self.canvas = canvas
    return canvas
end

return basecard
