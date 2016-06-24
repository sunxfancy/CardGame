local basecard = require('card.basecard')

local hellscream = basecard:new({
    type = "minion",
    cate = "warrior",
    cost = 8,
    ap = 4,
    hp = 9,
    name = "saber",
    discribe = "回合开始时，自动获得一个随机增益效果。"
})

return hellscream
