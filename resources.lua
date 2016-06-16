local resources = {
    imagePath = "res/image/",
    btnPath = "res/button/"
}

function resources.getImage(fileName)
    local fullpath = resources.imagePath .. fileName
    return love.graphics.newImage(fullpath)
end

function resources.getButton(fileName, ext)
    local fullpath = resources.btnPath .. fileName

    return love.graphics.newImage(fullpath..'_n.'..ext) ,
           love.graphics.newImage(fullpath..'_p.'..ext) ,
           love.graphics.newImage(fullpath..'_h.'..ext)
end

return resources
