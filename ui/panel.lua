require "ui/element"

Panel = setmetatable({}, { __index = Element })
Panel.__index = Panel

function Panel:new(x, y, width, height)
    local self = Element.new(self, x, y, width, height) -- Correctly inherit from Element
    return setmetatable(self, Panel)                    -- Ensure metatable is set for Panel methods
end

function Panel:draw()
    -- Draw background
    love.graphics.setColor(0.15, 0.15, 0.15)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    -- Draw child elements
    Element.draw(self)
end
