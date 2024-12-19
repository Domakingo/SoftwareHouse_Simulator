local softwarePlanMenu = require("softwarePlanMenu")
local computer = require("computer")

local menu = {
    isOpen = false,
    width = 400,
    height = 500,
    x = 0,
    y = 0
}

local function centerMenu()
    local screenWidth, screenHeight = love.graphics.getDimensions()
    menu.x = (screenWidth - menu.width) / 2
    menu.y = (screenHeight - menu.height) / 2
end

function menu.draw()
    if menu.isOpen then
        love.graphics.setColor(0.8, 0.8, 0.8)
        love.graphics.rectangle("fill", menu.x, menu.y, menu.width, menu.height)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("line", menu.x, menu.y, menu.width, menu.height)
    end
    softwarePlanMenu.draw(menu.x, menu.y, menu.width, menu.height)
end

function menu.mousepressed(x, y, button)
    if button == 1 and menu.isOpen then
        if not (x > menu.x and x < menu.x + menu.width and y > menu.y and y < menu.y + menu.height) then
            menu.close()
        end
        return true
    elseif computer.isClicked(x, y) then
        centerMenu()
        softwarePlanMenu.open()
        return true
    end
    return false
end

function menu.open()
    menu.isOpen = true
    centerMenu()
end

function menu.close()
    menu.isOpen = false
end

return menu