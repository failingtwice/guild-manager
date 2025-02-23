require "ui/element"
require "ui/panel"
require "ui/button"

Tabs = setmetatable({}, { __index = Element })
Tabs.__index = Tabs

function Tabs:new(x, y, width, height, tabData)
    local self = Element.new(self, x, y, width, height)
    self.activeTab = 1 -- Default to the first tab
    self.tabs = {}
    self.contentPanels = {}

    -- Create tab buttons
    local tabX = x
    local tabWidth = width / #tabData -- Auto-size tabs equally
    for i, tab in ipairs(tabData) do
        local button = Button:new(tabX, y, tabWidth, 40, tab.name, function()
            self.activeTab = i
        end)
        table.insert(self.tabs, button)
        tabX = tabX + tabWidth
    end

    -- Create tab content panels
    for i, tab in ipairs(tabData) do
        local panel = Panel:new(x, y + 40, width, height - 40)
        for _, element in ipairs(tab.elements) do
            panel:addChild(element) -- Add provided elements to panel
        end
        table.insert(self.contentPanels, panel)
    end

    return setmetatable(self, Tabs)
end

function Tabs:draw()
    -- Draw tab buttons
    for _, tab in ipairs(self.tabs) do
        tab:draw()
    end

    -- Draw the active tab's content panel
    self.contentPanels[self.activeTab]:draw()
end

function Tabs:update(mx, my)
    for _, tab in ipairs(self.tabs) do
        tab:update(mx, my)
    end
    self.contentPanels[self.activeTab]:update(mx, my)
end

function Tabs:mousepressed(mx, my, button)
    for _, tab in ipairs(self.tabs) do
        tab:mousepressed(mx, my, button)
    end
    self.contentPanels[self.activeTab]:mousepressed(mx, my, button)
end
