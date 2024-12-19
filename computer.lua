local computer = {
    x = 100, -- Posizione X
    y = 100, -- Posizione Y
    width = 50, -- Larghezza
    height = 50 -- Altezza
}

-- Disegna il computer (rettangolo verde di default)
function computer.draw(color)
    color = color or {0, 1, 0} -- Verde di default
    love.graphics.setColor(color)
    love.graphics.rectangle("fill", computer.x, computer.y, computer.width, computer.height)
end

-- Controlla se il computer è stato cliccato
function computer.isClicked(x, y)
    return x > computer.x and x < computer.x + computer.width and
           y > computer.y and y < computer.y + computer.height
end

return computer