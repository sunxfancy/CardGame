local basecard = require('card.basecard')
local magic = {
    basecard:new({
        type = "magic",
        cate = "warrior",
        cost = 8,
        ap = 4,
        hp = 9,
        name = "saber",
        image = "magic/saber.png",
        discribe = "回合开始时，自动获得一个随机增益效果。"
    }),

    basecard:new({
        type = "magic",
        cate = "warrior",
        cost = 8,
        ap = 4,
        hp = 9,
        name = "rider",
        image = "magic/rider.png",
        discribe = "回合开始时，自动获得一个随机增益效果。"
    }),
}

return magic
