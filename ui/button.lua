function Button(x, y, width, height, text, onClick)
    -- Draw button background
    love.graphics.setColor(0.2, 0.2, 0.2)
    love.graphics.rectangle("fill", x, y, width, height)

    -- Draw text
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(text, x + 10, y + 10)

    -- Handle mouse click
    if love.mouse.isDown(1) then
        local mx, my = love.mouse.getPosition()
        if mx >= x and mx <= x + width and my >= y and my <= y + height then
            onClick()
        end
    end
end
