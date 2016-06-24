
local Game = {}


-- {player1 = {}, player2 = {}}
function Game:new (obj)
    obj = obj or {}
    setmetatable(obj, {__index=self})
    obj.now_player = obj.player1
    obj.game_over = false
    obj.turn = coroutine.create(Game.turn)
    return obj
end

function Game:init ()
    coroutine.resume(self.turn)
end

function Game:drawCard ()
    local card = self.now_player:getCard()
    coroutine.yield()
end

function Game:playCard ()
    if self.now_player == self.player1 then
        coroutine.yield()
    end
end

function Game:quitTurn ()

end

function Game:turn ()
    repeat
        self:drawCard()
        self:playCard()
        self:quitTurn()
        self:changePlayer()
    until (self.game_over)
end



function Game:changePlayer ()
    if self.now_player == self.player1 then
        self.now_player = self.player2
    else
        self.now_player = self.player1
    end
end

return Game
