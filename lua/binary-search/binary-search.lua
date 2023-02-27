local function find (array, target)
 local lower_boundary = 1
 local upper_boundary = #array
 --
 while lower_boundary <= upper_boundary do
    testindex = (upper_boundary + lower_boundary) // 2 -- // -> integer division
    if array[testindex] == target then 
        return testindex
    elseif array[testindex] > target then 
        upper_boundary = testindex - 1
    else
        lower_boundary = testindex + 1
    end
 end
 --
 return -1
end

local function find_recursion(array, target)
    local function find_recursion_worker(lower_boundary, upper_boundary)
        if lower_boundary > upper_boundary then return -1 end
        testindex = (lower_boundary + upper_boundary) // 2
        if array[testindex] == target then 
            return testindex
        elseif array[testindex] > target then
            return find_recursion_worker(lower_boundary, testindex - 1)
        else
            return find_recursion_worker(testindex + 1, upper_boundary)
        end 
    end
    --
    if #array == 0 then return -1 end
    return find_recursion_worker(1, #array)
end

return find_recursion
