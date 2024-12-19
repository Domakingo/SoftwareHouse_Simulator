local json = require("libs.dkjson")

local softwarePlanMenu = {
    isOpen = false,
    name = "",
    description = "",
    language = "Lua",
    languages = {"Lua", "Python", "Java", "C++", "JavaScript"},
    submitButton = {x = 150, y = 200, width = 100, height = 30},
}

function softwarePlanMenu.open()
    softwarePlanMenu.isOpen = true
end

function softwarePlanMenu.close()
    softwarePlanMenu.isOpen = false
end

function softwarePlanMenu.draw(menuX, menuY, menuWidth, menuHeight)
    if softwarePlanMenu.isOpen then
        love.graphics.setColor(0.8, 0.8, 0.8)
        love.graphics.rectangle("fill", menuX, menuY, menuWidth, menuHeight)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("line", menuX, menuY, menuWidth, menuHeight)

        love.graphics.print("Software Name:", menuX + 20, menuY + 20)
        love.graphics.print("Description:", menuX + 20, menuY + 60)
        love.graphics.print("Programming Language:", menuX + 20, menuY + 100)

        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("line", menuX + 150, menuY + 15, 200, 30)
        love.graphics.print(softwarePlanMenu.name, menuX + 155, menuY + 20)

        love.graphics.rectangle("line", menuX + 150, menuY + 55, 200, 50)
        love.graphics.print(softwarePlanMenu.description, menuX + 155, menuY + 60)

        love.graphics.rectangle("line", menuX + 150, menuY + 95, 200, 30)
        love.graphics.print(softwarePlanMenu.language, menuX + 155, menuY + 100)

        love.graphics.setColor(0.3, 0.6, 0.3)
        love.graphics.rectangle("fill", softwarePlanMenu.submitButton.x, softwarePlanMenu.submitButton.y, softwarePlanMenu.submitButton.width, softwarePlanMenu.submitButton.height)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("Submit", softwarePlanMenu.submitButton.x + 20, softwarePlanMenu.submitButton.y + 5)
    end
end

function softwarePlanMenu.mousepressed(x, y, button)
    if softwarePlanMenu.isOpen then
        if x >= softwarePlanMenu.submitButton.x and x <= softwarePlanMenu.submitButton.x + softwarePlanMenu.submitButton.width and
           y >= softwarePlanMenu.submitButton.y and y <= softwarePlanMenu.submitButton.y + softwarePlanMenu.submitButton.height then
            softwarePlanMenu.saveData()
            softwarePlanMenu.close()
        end
    end
end

function softwarePlanMenu.saveData()
    local data = {
        name = softwarePlanMenu.name,
        description = softwarePlanMenu.description,
        language = softwarePlanMenu.language
    }

    local jsonData = json.encode(data, {indent = true})
    love.filesystem.createDirectory("data")
    local file = love.filesystem.newFile("data/software_plan.json", "w")
    file:write(jsonData)
    file:close()
end

return softwarePlanMenu