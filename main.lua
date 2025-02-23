require "ui/tabs"
require "ui/text"

local uiRoot

function love.load()
    -- Define tab content
    local tabData = {
        { name = "Home",     elements = { Text:new(30, 60, "Welcome to Home!", foreground, 24) } },
        { name = "Settings", elements = { Text:new(30, 60, "Settings Panel", foreground, 24) } },
        { name = "About",    elements = { Text:new(30, 60, "About this Game", foreground, 24) } }
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
