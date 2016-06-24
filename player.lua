local Player = {}


function copyTable (table)
    local t = {}
    for k, v in pairs(table) do
        t[k] = v
    end
end

-- must pass {master_name = '', cards = {} }
function Player:new (master, cards)
    local obj = {}
    setmetatable(obj, {__index = self})
    obj.hand_cards = {}
    obj.master = master
    obj.cards = copyTable(cards)
    return obj
end


function Player:getCard ()
    local num = love.math.random(#self.cards)
    local card = self.cards[num]
    table.remove(self.cards, num)
    table.insert(self.hand_cards, card)
    return card
end

function Player:useCard ()

end

function Player:moveCard ()
    -- body...
end


function Player:attackCard ()
    -- body...
end
