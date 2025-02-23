Element = {}
Element.__index = Element

function Element:new(x, y, width, height)
    local self = setmetatable({}, self) -- Set metatable on instance
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.children = {} -- Store nested UI elements
    return self
end

function Element:addChild(child)
    table.insert(self.children, child)
end

function Element:draw()
    for _, child in ipairs(self.children) do
        child:draw()
    end
end

function Element:update(mx, my)
    for _, child in ipairs(self.children) do
        if child.update then
            child:update(mx, my)
        end
    end
end

function Element:mousepressed(mx, my, button)
    for _, child in ipairs(self.children) do
        if child.mousepressed then
            child:mousepressed(mx, my, button)
        end
    end
end
