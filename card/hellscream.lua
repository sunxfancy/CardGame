basecard = dofile('card/basecard.lua')

local hellscream = basecard:new({
    type = "minion",
    cate = "warrior",
    cost = 8,
    ap = 4,
    hp = 9,
    name = "hellscream"
})

return hellscream