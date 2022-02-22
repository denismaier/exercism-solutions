local Anagram = {}
Anagram.__index = Anagram

function Anagram:new(str)
    local self = setmetatable({}, Anagram)
	self.content = str
	return self
end

function Anagram:match(strs)
    local result = {}
    for _, str in ipairs(strs) do 
        if is_anagram(self.content, str) then table.insert(result, str) end
    end
    return result
end


-- helper functions

function is_anagram(str1, str2)
    -- string length not equal
    if str1:len() ~= str2:len() then return false end
    return arrayEqual(string_to_sorted_table(str1), string_to_sorted_table(str2))
end

function string_to_sorted_table (str)
    str = str:lower()
    local result = {}
    for i = 1, string.len(str), 1 do
        table.insert(result, str:sub(i, i))
    end
    table.sort(result)
    return result
end

function arrayEqual(a1, a2)
    -- arrays length not equal (not strictly necesary since we already know this)
    if #a1 ~= #a2 then return false end
    for i, v in ipairs(a1) do
        if v ~= a2[i] then return false end
    end
    return true
end

return Anagram
