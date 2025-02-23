require "ui/text"

function HeroCard(x, y, hero)
    local self = {
        x = x,
        y = y,
        width = 250,
        height = 300,
        hero = hero,
        imgSize = 250, -- Fixed size for square image
    }

    function self:draw()
        local paddingLeft = 6;
        -- Draw Hero Image (Always 250x250)
        love.graphics.setColor(1, 1, 1, 1)

        if self.hero.portrait then
            love.graphics.draw(self.hero.portrait, self.x, self.y, 0, self.imgSize / self.hero.portrait:getWidth(),
                self.imgSize / self.hero.portrait:getHeight())
        else
            -- Placeholder for missing image
            love.graphics.setColor(0.5, 0.5, 0.5)
            love.graphics.rectangle("fill", self.x, self.y, self.imgSize, self.imgSize)
            love.graphics.setColor(1, 1, 1)
            love.graphics.print("No Image", self.x + 85, self.y + 120)
        end

        -- Card Background
        love.graphics.setColor(0.85, 0.85, 0.9)
        love.graphics.rectangle("fill", self.x, self.y + self.imgSize, self.width, 185)

        -- Hero Name
        Heading(self.x + paddingLeft, self.y + self.imgSize + 5, self.hero.name, "dark")

        -- Race & Class
        Text(self.x + paddingLeft, self.y + self.imgSize + 40, self.hero.race, "dark")
        Text(self.x + paddingLeft, self.y + self.imgSize + 60, self.hero.class, "dark")
        Text(self.x + paddingLeft, self.y + self.imgSize + 80, "Height: " .. self.hero.height .. "cm", "dark")
        Text(self.x + paddingLeft, self.y + self.imgSize + 100, "Weight: " .. self.hero.weight .. "kg", "dark")


        -- Stats
        -- Text(self.x + paddingLeft, self.y + self.imgSize + 60, "Attack Damage: " .. self.hero.attack, "dark")
        -- self:drawBlockProgressBar(self.x + paddingLeft, self.y + self.imgSize + 80, self.hero.attack)  -- Red
        -- Text(self.x + paddingLeft, self.y + self.imgSize + 100, "Health: " .. self.hero.health, "dark")
        -- self:drawBlockProgressBar(self.x + paddingLeft, self.y + self.imgSize + 120, self.hero.health) -- Green
        -- Text(self.x + paddingLeft, self.y + self.imgSize + 140, "Mana: " .. self.hero.mana, "dark")
        -- self:drawBlockProgressBar(self.x + paddingLeft, self.y + self.imgSize + 160, self.hero.mana)   -- Blue
    end

    -- Block-style progress bar
    function self:drawBlockProgressBar(x, y, value)
        local maxBlocks = 20  -- Total number of blocks
        local blockWidth = 10 -- Width of each block
        local gap = 2         -- Gap between blocks
        local maxStat = 100   -- Normalize stats to 100

        local filledBlocks = math.min(math.floor(value / maxStat * maxBlocks), maxBlocks)

        -- Generate color based on number of filled blocks
        local function getColor(percentage)
            if percentage < 0.5 then
                -- From Red (0.8, 0, 0) to Yellow (0.8, 0.8, 0)
                local g = percentage * 2 * 0.8 -- Increase green
                return { 0.8, g, 0, 1 }
            else
                -- From Yellow (0.8, 0.8, 0) to Green (0, 0.8, 0)
                local r = (1 - percentage) * 2 * 0.8 -- Decrease red
                return { r, 0.8, 0, 1 }
            end
        end

        local fillColor = getColor(filledBlocks / maxBlocks) -- Determine color for all filled blocks

        -- Draw filled blocks with the same determined color
        love.graphics.setColor(fillColor)
        for i = 0, filledBlocks - 1 do
            love.graphics.rectangle("fill", x + i * (blockWidth + gap), y, blockWidth, 10)
        end

        -- Draw remaining unfilled blocks as gray
        love.graphics.setColor(0.3, 0.3, 0.3)
        for i = filledBlocks, maxBlocks - 1 do
            love.graphics.rectangle("fill", x + i * (blockWidth + gap), y, blockWidth, 10)
        end
    end

    return self
end
