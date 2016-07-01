local basecard = require('card.basecard')
local servant = {
    basecard:new({
        type = "servant",
        cate = "warrior",
        cost = 8,
        ap = 4,
        hp = 9,
        name = "saber",
        image = "servant/saber.png",
        discribe = "回合开始时，自动获得一个随机增益效果。"
    }),

    basecard:new({
        type = "servant",
        cate = "warrior",
        cost = 8,
        ap = 4,
        hp = 9,
        name = "rider",
        image = "servant/rider.png",
        discribe = "回合开始时，自动获得一个随机增益效果。"
    }),
}

return servant
