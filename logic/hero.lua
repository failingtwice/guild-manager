require "logic/data"

Hero = {}

function Hero:new(name, race, class, portrait, height, weight)
    local self = {}
    self.name = name
    self.race = race
    self.class = class
    self.portrait = portrait
    self.height = height
    self.weight = weight
    return self
end

function getRandomHero()
    local race = getRandomRace()
    local name = getRandomName(race)
    local class = getRandomClass()
    local portrait = getRandomPortrait(race)
    local height = getRandomHeight(race)
    local weight = getWeightByHeight(height, race)

    return Hero:new(name, race, class, portrait, height, weight)
end
