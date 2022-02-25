local Anagram = {}
Anagram.__index = Anagram

function Anagram:new(str)
    local self = setmetatable({}, Anagram)
	self.original = str
    self.sorted = sortString(str)
	return self
end

function Anagram:match(strs)
    local result = {}
    for _, str in ipairs(strs) do
        strToMatch = sortString(str)
        if (str ~= self.original and strToMatch == self.sorted) then table.insert(result, str) end
    end
    return result
end

-- helper

function sortString (str)
    local letters = {}
    local str = str:lower()
    for char in string.gmatch(str, ".") do table.insert(letters, char) end
    table.sort(letters)
    return table.concat(letters)
end

return Anagram
