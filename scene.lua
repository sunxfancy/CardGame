local scene = {
    main_ui = require('main_ui'),
    battle_ui = require('battle_ui')
}

local funclist = {
    'directorydropped',
    'draw',
    'errhand',
    'filedropped',
    'focus',
    'keypressed',
    'keyreleased',
    'load',
    'lowmemory',
    'mousefocus',
    'mousemoved',
    'mousepressed',
    'mousereleased',
    'quit',
    'resize',
    'run',
    'textedited',
    'textinput',
    'threaderror',
    'touchmoved',
    'touchpressed',
    'touchreleased',
    'update',
    'visible',
    'wheelmoved',
    'gamepadaxis',
    'gamepadpressed',
    'gamepadreleased',
    'joystickadded',
    'joystickaxis',
    'joystickhat',
    'joystickpressed',
    'joystickreleased',
    'joystickremoved'
}

function scene.changeScene(s)
    if s.isInit == nil then
        s.init()
        s.isInit = true
        s.parent = scene
    end
    scene.nowScene = s
    for i, v in pairs(funclist) do
        if s[v] ~= nil then
            love[v] = s[v]
        else
            love[v] = nil
        end
    end
end



return scene
