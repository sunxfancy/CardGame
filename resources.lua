local resources = {
    imagePath = "res/image/",
    cardPath = "res/card/",
    imageTable = {},
    btnPath = "res/button/",
    btnTable = {}
}

function resources.getCard(fileName)
    local t = resources.imageTable
    if t[fileName] == nil then
        local fullpath = resources.cardPath .. fileName
        t[fileName] = love.graphics.newImage(fullpath)
    end
    return t[fileName]
end

function resources.getImage(fileName)
    local t = resources.imageTable
    if t[fileName] == nil then
        local fullpath = resources.imagePath .. fileName
        t[fileName] = love.graphics.newImage(fullpath)
    end
    return t[fileName]
end

function resources.getButton(fileName, ext)
    local t = resources.btnTable
    if t[fileName] == nil then
        local fullpath = resources.btnPath .. fileName
        t[fileName] = {
            love.graphics.newImage(fullpath..'_n.'..ext) ,
            love.graphics.newImage(fullpath..'_p.'..ext) ,
            love.graphics.newImage(fullpath..'_h.'..ext)
        }
    end
    return  t[fileName][1],
            t[fileName][2],
            t[fileName][3]
end

return resources
