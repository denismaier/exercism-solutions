function normalize(s)
    s = s:gsub("%A", "")
    s = s:lower()
    return s
end

function isogramViaTable(s)
    s = normalize(s)
    -- table to remember seen letters
    local seen = {}
    -- iterate over letters
    for i = 1, #s do
        -- get current letter
        local letter = s:sub(i, i)
        -- return false if the letter has been seen
        if seen[letter] == true then return false
        -- add letter to helper table
        else seen[letter] = true
        end 
    end
    -- if we're still here, it's an isogram
    return true
end

function isogramViaString (s)
    -- normalize string
    s = normalize(s)
    -- comparison string
    compare = ""
    -- iterate over letters
    for i = 1, #s do
        local letter = s:sub(i, i) 
        if compare:find(letter) then return false 
        else compare = compare .. letter
        end
    end
    return true
end

function isogramViaStringVar (s)
    -- normalize string
    s = normalize(s)
    -- comparison string
    compare = ""
    -- iterate over letters
    for i = 1, #s do
        local letter = s:sub(i, i) 
        if not compare:find(letter) then compare = compare .. letter end
    end
    if compare == s then return true
    else return false
    end
end

-- which version do we want?
-- return isogramViaList
return isogramViaString
-- return isogramViaStringVar