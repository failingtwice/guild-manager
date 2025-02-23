require "ui/element"
require "ui/panel"
require "ui/text"
require "ui/theme"

HeroCard = setmetatable({}, { __index = Element })
HeroCard.__index = HeroCard

function HeroCard:new(x, y, hero)
    local self = Element.new(self, x, y, 250, 350) -- Fixed card size

    -- Background Panel
    self.panel = Panel:new(x, y, self.width, self.height, heroCardBackground)

    -- Hero Image (if exists)
    self.heroImage = hero.portrait and {
        image = hero.portrait,
        x = x,
        y = y,
        width = 250,
        height = 250
    } or nil

    -- Hero Name
    self.nameText = Text:new(x + 6, y + 255, hero.name, foreground)

    -- Race, Class, Height, Weight
    self.raceText = Text:new(x + 6, y + 275, hero.race, foreground)
    self.classText = Text:new(x + 6, y + 290, hero.class, foreground)
    self.heightText = Text:new(x + 6, y + 305, "Height: " .. hero.height .. "cm", foreground)
    self.weightText = Text:new(x + 6, y + 320, "Weight: " .. hero.weight .. "kg", foreground)

    -- Add elements to panel
    self.panel:addChild(self.nameText)
    self.panel:addChild(self.raceText)
    self.panel:addChild(self.classText)
    self.panel:addChild(self.heightText)
    self.panel:addChild(self.weightText)

    return setmetatable(self, HeroCard)
end

function HeroCard:draw()
    -- Draw Background
    self.panel:draw()

    -- Draw Hero Image (if available)
    if self.heroImage then
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.heroImage.image, self.heroImage.x, self.heroImage.y, 0,
            self.heroImage.width / self.heroImage.image:getWidth(),
            self.heroImage.height / self.heroImage.image:getHeight())
    else
        -- Placeholder for missing image
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.rectangle("fill", self.x, self.y, 250, 250)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("No Image", self.x + 85, self.y + 120)
    end
end
