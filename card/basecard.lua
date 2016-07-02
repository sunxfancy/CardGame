local resources = require "resources"
local basecard = {
    type = "servant",
    cate = "all",
    cost = 0,
    ap = 0,
    hp = 0,
    name = nil,
    image = "",
    describe = "",
    atk_img = resources.getImage('attacktexture.png'),
    hp_img = resources.getImage('healthtexture.png'),
    cost_img = resources.getImage('magictexture.png'),
    shader = love.graphics.newShader( "shader/outline.glsl" )
}

function basecard:new(card)
    card = card or {}
    setmetatable(card, {__index = self })
    return card
end

function basecard:init()
    self.image = resources.getCard(self.image) -- size must be 230x308
    self.cover = resources.getImage(self.cate..'.png') -- size must be 360x505
    self.isInit = true
end

local cw, ch, iw, ih = 360, 505, 230, 308

local ff = function () -- 滤镜效果
    love.graphics.ellipse( 'fill', cw/2, ih/2, iw/2, ih/2 ) -- ellipse size
end

local font = love.graphics.newFont("res/fonts/文泉驿正黑.ttf", 26)
local font_name = love.graphics.newFont("res/fonts/文泉驿正黑.ttf", 60)
local font_num = love.graphics.newFont("res/fonts/Montserrat-Bold.ttf", 72)

-- 卡片属性修改后，注意要调用repaint清除当前的绘图缓存
function basecard:repaint()
    self.canvas = nil
end

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

    -- 绘制描述内容
    love.graphics.printf(self.discribe, 60, ih+20, cw-120)

    -- 绘制名字
    love.graphics.setFont(font_name)
    love.graphics.printf(self.name, 0, ih-80, cw, "center")

    -- 绘制攻击,血量,魔耗
    love.graphics.draw(self.atk_img, 0, ch-100)
    love.graphics.draw(self.hp_img, cw-80, ch-100)
    love.graphics.draw(self.cost_img, -25, -20)

    -- 绘制数字及其阴影
    love.graphics.setFont(font_num)
    love.graphics.print(tostring(self.cost), 25, 3)
    love.graphics.print(tostring(self.ap), 36, ch-77, 0, 0.8, 0.8)
    love.graphics.print(tostring(self.hp), cw-50, ch-77, 0, 0.8, 0.8)
    love.graphics.setShader( self.shader )
    love.graphics.print(tostring(self.cost), 25, 3)
    love.graphics.print(tostring(self.ap), 36, ch-77, 0, 0.8, 0.8)
    love.graphics.print(tostring(self.hp), cw-50, ch-77, 0, 0.8, 0.8)
    love.graphics.setShader()
    love.graphics.setCanvas(old_cvs)

    self.canvas = canvas
    return canvas
end

return basecard
