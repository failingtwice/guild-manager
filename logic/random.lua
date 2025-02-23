Random = {}

-- Returns a random integer between min and max (inclusive)
function Random.int(min, max)
    return math.random(min, max)
end

-- Returns a random float between min and max
function Random.float(min, max)
    return min + math.random() * (max - min)
end

-- Returns a random element from a table
function Random.choice(tbl)
    if #tbl == 0 then
        error("Random.choice called on an empty table")
    end
    return tbl[math.random(1, #tbl)]
end

-- Seeds the random generator (useful for reproducible randomness)
function Random.seed(value)
    math.randomseed(value or os.time())
end

function Random.bellCurve(mean, stddev, flatness)
    -- Box-Muller Transform
    local u1 = math.random()
    local u2 = math.random()
    local z = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)

    -- Flattens the curve (higher `flatness` = wider spread)
    return mean + (z * stddev * flatness)
end
