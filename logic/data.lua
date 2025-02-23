require "logic/constants"
require "logic/random"

function getRandomRace()
    return Random.choice(RACE())
end

function getRandomClass()
    return Random.choice(CLASS())
end

function getRandomHeight(race)
    local range = HEIGHT_RANGES[race]

    local mean = (range.min + range.max) / 2   -- Midpoint (average height)
    local stddev = (range.max - range.min) / 6 -- Approximate stddev (6σ rule)

    local flatness = 1.5                       -- Increase to make curve flatter (1.0 is normal)
    local height = Random.bellCurve(mean, stddev, flatness)

    -- Clamp to valid range
    return math.max(range.min, math.min(range.max, math.floor(height)))
end

function getWeightByHeight(height, race)
    local randomRatio = Random.bellCurve(WEIGHT_TO_HEIGHT_RATIO[race], 0.1, 1.5)
    return math.floor(height * randomRatio)
end

function getRandomName(race)
    local names = NAMES[race]
    return Random.choice(names.first_names) .. " " .. Random.choice(names.second_names)
end

local portraitsPath = "assets/portraits/"

function getRandomPortrait(race)
    local numberOfPortraits = love.filesystem.getDirectoryItems(portraitsPath .. race)
    local portraitIndex = Random.int(1, #numberOfPortraits)

    local portrait = love.graphics.newImage(portraitsPath ..
        race .. "/" .. string.lower(race) .. "_" .. portraitIndex .. ".png")
    return portrait
end
