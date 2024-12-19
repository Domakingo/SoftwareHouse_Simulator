local computer = require("computer")
local softwarePlanMenu = require("softwarePlanMenu")
local menu = require("menu")

-- Variabili per la posizione del personaggio
local player = {
    x = 200,
    y = 200,
    width = 50,
    height = 50,
    speed = 200 -- Velocità di movimento (pixel al secondo)
}

-- Inizializza la finestra di gioco
function love.load()
    love.window.setTitle("SoftwareHouse Simulator")
    love.window.setMode(800, 600) -- Risoluzione della finestra
end

-- Aggiorna la logica del gioco
function love.update(dt)
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
    elseif love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    end
end

-- Disegna gli elementi sullo schermo
function love.draw()
    -- Disegna il computer e il menu
    computer.draw()
    menu.draw()

    -- Disegna il player
    love.graphics.setColor(1, 0, 0) -- Rosso
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function love.mousepressed(x, y, button)
    -- Gestisce i click sui vari oggetti
    if not menu.mousepressed(x, y, button) and not softwarePlanMenu.mousepressed(x, y, button) then
        -- Altri click che non riguardano il menu o il piano software
    end
end

