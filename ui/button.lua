require "ui/element"

Button = setmetatable({}, { __index = Element })
Button.__index = Button

function Button:new(x, y, width, height, text, onClick)
    local self = Element.new(self, x, y, width, height)
    self.text = text
    self.onClick = onClick
    self.isHovered = false
    return setmetatable(self, Button) -- Ensure metatable is set
end

function Button:draw()
    -- Change color if hovered
    if self.isHovered then
        love.graphics.setColor(0.3, 0.3, 0.3)
    else
        love.graphics.setColor(0.2, 0.2, 0.2)
    end

    -- Draw button
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    -- Draw text
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(self.text, self.x + 10, self.y + 10)
end

function Button:update(mx, my)
    self.isHovered = mx >= self.x and mx <= self.x + self.width and my >= self.y and my <= self.y + self.height
end

function Button:mousepressed(mx, my, button)
    if button == 1 and self.isHovered then
        self.onClick()
    end
end
