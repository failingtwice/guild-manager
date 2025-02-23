function Enum(tbl)
    local enum = {}
    local list = {} -- Store indexed values for Random.choice()

    for _, v in ipairs(tbl) do
        enum[v] = v
        table.insert(list, v) -- Store in list for random selection
    end

    -- Protect against invalid keys
    return setmetatable(enum, {
        __index = function(_, key)
            error("Invalid enum key: " .. tostring(key), 2)
        end,
        __call = function() return list end -- Allows iteration
    })
end
