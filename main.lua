require "ui/tabs"
require "ui/text"
require "ui/heroCard"
require "logic.hero"

local uiRoot

function love.load()
    heroCount = 5
    heroes = {}
    for i = 1, heroCount do
        table.insert(heroes, getRandomHero())
    end

    local rosterTab = {
        name = "Roster",
        elements = {}
    }

    for i = 1, heroCount do
        table.insert(rosterTab.elements, HeroCard:new(30 + (i - 1) * 270, 60, heroes[i]))
    end

    -- Define tab content
    local tabData = {
        { name = "Home",  elements = { Text:new(30, 60, "Welcome to Home!", foreground) } },
        rosterTab,
        { name = "About", elements = { Text:new(30, 60, "About this Game", foreground) } }
    }

    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()

    local backgroundColor = { 0.95, 0.95, 0.95, 1 }
    uiRoot = Panel:new(0, 0, windowWidth, windowHeight, backgroundColor)
    uiRoot:addChild(Tabs:new(0, 0, windowWidth, windowHeight, tabData))
end

function love.update(dt)
    local mx, my = love.mouse.getPosition()
    uiRoot:update(mx, my)
end

function love.draw()
    uiRoot:draw()
end

function love.mousepressed(mx, my, button)
    uiRoot:mousepressed(mx, my, button)
end
