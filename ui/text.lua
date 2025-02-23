require "ui/element"

Text = setmetatable({}, { __index = Element })
Text.__index = Text

function Text:new(x, y, text, color, fontSize)
    local self = Element.new(self, x, y, 0, 0) -- No fixed width/height
    self.text = text
    self.color = color or { 1, 1, 1 }
    self.font = love.graphics.newFont(fontSize or 14)
    return setmetatable(self, Text) -- Ensure metatable is set
end

function Text:draw()
    love.graphics.setColor(self.color)
    love.graphics.setFont(self.font)
    love.graphics.print(self.text, self.x, self.y)
end
