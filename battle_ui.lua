
local Button = require "button"

local battle_ui = {
    hands = nil
}

local tbtn = Button:new({image = "test",  rect = {x=100, y=100, w=172, h=56} })

function battle_ui.init ()
    battle_ui.hands = {
        require 'card/hellscream'
    }
    battle_ui.children = {
        tbtn
    }
end

function battle_ui.draw (dt)
    for i, card in pairs(battle_ui.hands) do
        if card ~= nil then
            card:paint(200, 200, 0)
        end
    end
    for k,v in pairs(battle_ui.children) do
        v:draw(dt)
    end
end

function tbtn:onClick (e)

end

function battle_ui.mousepressed (x, y, btn, istouch)
    for k,v in pairs(battle_ui.children) do
        v:mousepressed(x, y, btn, istouch)
    end
end

function battle_ui.mousereleased (x, y, btn, istouch)
    for k,v in pairs(battle_ui.children) do
        v:mousereleased(x, y, btn, istouch)
    end
end

function battle_ui.mousemoved (x, y, dx, dy, istouch)
    for k,v in pairs(battle_ui.children) do
        v:mousemoved(x, y, dx, dy, istouch)
    end
end

return battle_ui
