require "ui/element"

Panel = setmetatable({}, { __index = Element })
Panel.__index = Panel

function Panel:new(x, y, width, height, color)
    local self = Element.new(self, x, y, width, height) -- Correctly inherit from Element
    self.color = color or { 0, 0, 0, 0 }
    return setmetatable(self, Panel)                    -- Ensure metatable is set for Panel methods
end

function Panel:draw()
    -- Draw background
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    -- Draw child elements
    Element.draw(self)
end
