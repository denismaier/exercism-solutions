local grains = {}

function grains.square(n)
    return 2^(n-1)
end

-- approach with a loop
function grains.totalTillLoop()
    result = 0
    for i = 1,64,1 do
        result = result + grains.square(i)
    end
    return result
end  

-- recursive approach
function grains.totalTillRecursive(n)
    if n == 1 then 
        return 1
    else 
        return grains.square(n) + grains.totalTillRecursive(n-1)
    end
end

-- arithmetic approach
function grains.totalArithmetic()
    return 2^64-1
end

function grains.total()
    -- return grains.totalTillLoop(64)
    -- return grains.totalTillRecursive(64)
    return grains.totalArithmetic()
end

return grains
