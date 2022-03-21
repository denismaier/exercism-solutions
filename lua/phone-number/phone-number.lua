local PhoneNumber = {}

PhoneNumber.__index = PhoneNumber

function PhoneNumber:new(input)
    local self = setmetatable({}, PhoneNumber)
    self.cleaned = input:gsub('%D','')
    self.number = validate_number(self.cleaned)
	return self
end

function PhoneNumber:areaCode()
    return string.sub(self.number, 1, 3)
end

function PhoneNumber:__tostring()
    return self.number:gsub("(...)(...)(....)", "(%1) %2-%3")
end

function validate_number(input)
    if string.len(input) == 10 then return input end
    if (string.len(input) == 11 and string.sub(input, 1, 1) == '1') then return string.sub(input, 2) end
    return '0000000000'
end

return PhoneNumber


