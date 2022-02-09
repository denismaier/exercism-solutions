return function(s)
    -- normalize to lower case
    s = s:lower()
    -- define allowed characters
    letters = "abcdefghijklmnopqrstuvwxyz"
    -- iterate over letters to see if s contains each letter
    for i = 1, #letters do
        letter = letters:sub(i,i)
        if (not s:find(letter)) then return false end
    end
    return true
end
