function TabManager(x, y, width, height, tabNames, onChange)
    local self = {
        x = x,
        y = y,
        width = width,
        height = height,
        activeTab = 1,
        tabs = {},
        onChange = onChange or function() end
    }

    -- Create tab buttons
    local tabWidth = width / #tabNames
    for i, name in ipairs(tabNames) do
        table.insert(self.tabs, Button(x + (i - 1) * tabWidth, y, tabWidth, height, name, function()
            self.activeTab = i
            self.onChange(i, name)
        end))
    end

    function self:update(dt)
        local mouseX, mouseY = love.mouse.getPosition()
        for _, tab in ipairs(self.tabs) do
            tab:update(mouseX, mouseY)
        end
    end

    function self:draw()
        -- Draw tab buttons
        for _, tab in ipairs(self.tabs) do
            tab:draw()
        end

        -- Draw underline for active tab
        local activeTab = self.tabs[self.activeTab]
        if activeTab then
            love.graphics.setColor(1, 0, 0) -- Red underline for active tab
            love.graphics.rectangle("fill", activeTab.x, activeTab.y + height - 2, activeTab.width, 2)
        end
    end

    function self:mousepressed(x, y)
        for _, tab in ipairs(self.tabs) do
            tab:mousepressed(x, y)
        end
    end

    return self
end
