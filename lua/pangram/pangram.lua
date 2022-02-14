-- loop
function pangramLoop(s)
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

-- recursive
function pangramRecursive(s)
    function worker(letters, s)
        -- base case, no more letters to check
        if letters == "" then return true end
        -- first letter not found in s
        if (not s:find(letters:sub(1,1))) then return false end
        -- check next letter
        return worker(letters:sub(2), s)
    end
    s = s:lower()
    return worker("abcdefghijklmnopqrstuvwxyz", s)
end

return pangramRecursive