local basecard = require('card.basecard')
local master = {
    basecard:new({
        type = "master",
        cate = "warrior",
        cost = 8,
        ap = 4,
        hp = 9,
        name = "saber",
        image = "master/saber.png",
        discribe = "回合开始时，自动获得一个随机增益效果。"
    }),

    basecard:new({
        type = "master",
        cate = "warrior",
        cost = 8,
        ap = 4,
        hp = 9,
        name = "rider",
        image = "master/rider.png",
        discribe = "回合开始时，自动获得一个随机增益效果。"
    }),
}

return master
