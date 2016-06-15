local resources = require "resources"
local main_ui = {
    bg_pos = 0,
    btn_location = {
        x = 600,
        y = 450,
        r = 110,    --display range
        cr = 90    --client range
    }
}

function main_ui.init()
    main_ui.bg1 = resources.getImage("main_bk1.jpg")
    main_ui.begin_btn = resources.getImage("begin.png")
end

function main_ui.update()
    main_ui.bg_pos = main_ui.bg_pos - 1
    if main_ui.bg_pos <= -2000 then
        main_ui.bg_pos = 0
    end
end

function main_ui.draw()
    love.graphics.draw(main_ui.bg1, main_ui.bg_pos, -300)
    love.graphics.draw(
        main_ui.begin_btn, 
        main_ui.btn_location.x,
        main_ui.btn_location.y,
        0, 1, 1 ,
        main_ui.btn_location.r,
        main_ui.btn_location.r
    )
end

function main_ui.mousepressed(x, y, btn, istouch)
    local dx = main_ui.btn_location.x - x
    local dy = main_ui.btn_location.y - y
    if dx < main_ui.btn_location.cr and dy < main_ui.btn_location.cr then
        local r2 = math.pow(main_ui.btn_location.cr, 2)
        local x2 = math.pow(dx, 2)
        local y2 = math.pow(dy, 2)        
        if r2 >= x2 + y2 then
            main_ui.parent.changeScene(main_ui.parent.battle_ui)
        end
    end
end

return main_ui
