-- functional helpers
local function filter (pred, list)
    local result = {}
    for i, v in ipairs(list) do
        if pred(v) then table.insert(result, v) end
    end 
    return result
end

local function foldl(operation, acc, list)
    for _, el in ipairs(list) do
        acc = operation(acc, el)
    end
    return acc
end

local function add(a, b)
    return a + b
end

-- testing functions

local function is_multiple(a, b)
    if a % b == 0 and a ~= b then  return true 
    else return false
    end    
end

local function is_multiple_or_same(a, b)
    if a % b == 0 then return true 
    else return false
    end    
end

local function is_unique_in_list(a, table)
    for i, v in ipairs(table) do
        if is_multiple(a, v) == true then return false end
    end
    return true
end

local function value_in_table (a, tab)
    for _, v in ipairs(tab) do
        if a == v then return true end
    end
    return false
end

-- let's do it

local function sum_of_multiples(numbers)
    unique_numbers = filter(function (x) return is_unique_in_list(x, numbers) end, numbers)
    return {
        to = function(max)
            numbers_to_sum_up = {}
            for _, number in ipairs(unique_numbers) do
                for tested = number, max - 1, 1 do
                    if is_multiple_or_same(tested, number) and value_in_table(tested, numbers_to_sum_up) == false then table.insert(numbers_to_sum_up, tested) end
                end
            end
            return foldl(add, 0, numbers_to_sum_up)
        end
    }
end

return sum_of_multiples