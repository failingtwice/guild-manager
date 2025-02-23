UI = {
    elements = {}
}

function UI:add(element)
    table.insert(self.elements, element)
end

function UI:update(dt)
    local mouseX, mouseY = love.mouse.getPosition()
    for _, element in ipairs(self.elements) do
        if element.update then
            element:update(mouseX, mouseY)
        end
    end
end

function UI:draw()
    for _, element in ipairs(self.elements) do
        if element.draw then
            element:draw()
        end
    end
end

function UI:mousepressed(x, y, button)
    if button == 1 then
        for _, element in ipairs(self.elements) do
            if element.mousepressed then
                element:mousepressed(x, y)
            end
        end
    end
end
