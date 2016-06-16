
local battle_ui = {
    hands = nil
}

function battle_ui.init ()
    battle_ui.hands = {
        require 'card/hellscream'
    }
end

function battle_ui.draw ()
    for i, card in pairs(battle_ui.hands) do
        if card ~= nil then
            card:paint(200, 200, 0)
        end
    end
end

return battle_ui
