require "ui/element"
require "ui/theme"
require "ui/text"

Button = setmetatable({}, { __index = Element })
Button.__index = Button

function Button:new(x, y, width, height, text, onClick)
    local self = Element.new(self, x, y, width, height)
    self.onClick = onClick
    self.isHovered = false

    -- Create centered text (initial placeholder, position set in update)
    self.textElement = Text:new(x, y, text, buttonForeground, 16)

    return setmetatable(self, Button)
end

function Button:update(mx, my)
    self.isHovered = mx >= self.x and mx <= self.x + self.width and my >= self.y and my <= self.y + self.height

    -- Center text manually
    local textWidth = self.textElement.font:getWidth(self.textElement.text)
    local textHeight = self.textElement.font:getHeight()

    self.textElement.x = self.x + (self.width - textWidth) / 2
    self.textElement.y = self.y + (self.height - textHeight) / 2
end

function Button:draw()
    -- Change color if hovered
    if self.isHovered then
        love.graphics.setColor(buttonHovered)
    else
        love.graphics.setColor(buttonBackground)
    end

    -- Draw button background
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    -- Draw text
    self.textElement:draw()
end

function Button:mousepressed(mx, my, button)
    if button == 1 and self.isHovered then
        self.onClick()
    end
end
