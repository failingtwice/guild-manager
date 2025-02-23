require "ui/tabManager"
require "ui/ui"
require "ui/button"
require "ui/heroCard"
require "logic/data"
require "logic/enums"
require "logic/hero"

local tabManager
local activeTabContent

function love.load()
    local textFont = love.graphics.newFont("fonts/MedodicaRegular.otf", 32) -- Load font at 24px size
    textFont:setFilter("nearest", "nearest")
    love.graphics.setFont(textFont)                                         -- Apply it globally

    local numberOfHeroes = 10
    local heroes = {}
    for i = 1, numberOfHeroes do
        heroes[i] = getRandomHero()
    end

    HeroCards = {}

    for i, hero in ipairs(heroes) do
        HeroCards[i] = HeroCard(12 + (i - 1) * 255, 100, hero)
    end
end

function love.update(dt)
end

function love.draw()
    Button(100, 100, 100, 100, "Click me", function()
        print("Button clicked")
    end)
end

function love.mousepressed(x, y, button)

end
