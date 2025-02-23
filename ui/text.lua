local textFont = love.graphics.newFont("fonts/MedodicaRegular.otf", 16) -- Load font at 24px size
local headingFont = love.graphics.newFont("fonts/yoster.ttf", 24)       -- Load font at 24px size
textFont:setFilter("nearest", "nearest")
headingFont:setFilter("nearest", "nearest")

local colorDark = { 0.15, 0.15, 0.1 }
local colorLight = { 0.85, 0.85, 0.9 }

function Text(x, y, text, color)
    local prevFont = love.graphics.getFont()

    if not text then
        text = "No text"
    end

    if color == "dark" then
        color = colorDark
    elseif color == "light" then
        color = colorLight
    end

    love.graphics.setFont(textFont)
    love.graphics.setColor(color)
    love.graphics.print(text, x, y)

    love.graphics.setFont(prevFont)
end

function Heading(x, y, text, color)
    local prevFont = love.graphics.getFont()

    if not text then
        text = "No text"
    end

    if color == "dark" then
        color = colorDark
    elseif color == "light" then
        color = colorLight
    end

    love.graphics.setFont(headingFont)
    love.graphics.setColor(color)
    love.graphics.print(text, x, y)

    love.graphics.setFont(prevFont)
end

return {
    Text = Text,
    Heading = Heading
}
