require "ui/tabs"
require "ui/text"

local uiRoot

function love.load()
    -- Define tab content
    local tabData = {
        { name = "Home",     elements = { Text:new(30, 60, "Welcome to Home!", { 1, 1, 1 }, 24) } },
        { name = "Settings", elements = { Text:new(30, 60, "Settings Panel", { 1, 1, 1 }, 24) } },
        { name = "About",    elements = { Text:new(30, 60, "About this Game", { 1, 1, 1 }, 24) } }
    }

    uiRoot = Tabs:new(20, 20, 600, 400, tabData)
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
