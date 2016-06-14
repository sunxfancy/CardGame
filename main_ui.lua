
local main_ui = {
    bg_pos = 0
}

function main_ui.init ()
    main_ui.bg1 = love.graphics.newImage("res/image/main_bk1.jpg")
    main_ui.begin_btn = love.graphics.newImage("res/image/begin.png")
end

function main_ui.update()
    main_ui.bg_pos = main_ui.bg_pos - 1
    if main_ui.bg_pos <= -2000 then
        main_ui.bg_pos = 0
    end
end

function main_ui.draw ()
    love.graphics.draw(main_ui.bg1, main_ui.bg_pos, -300)
    love.graphics.draw(main_ui.begin_btn, 600, 450, 0, 1, 1 ,
        main_ui.begin_btn:getWidth()/2,
        main_ui.begin_btn:getHeight()/2)
end


function main_ui.mousepressed (x, y, btn, istouch)
    
end

return main_ui
