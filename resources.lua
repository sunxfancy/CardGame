local resources = {
    imagePath = "res/image/"
}

function resources.getImage(fileName)
    local fullpath = resources.imagePath .. fileName
    return love.graphics.newImage(fullpath)
end

return resources