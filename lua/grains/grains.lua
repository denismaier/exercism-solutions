local grains = {}

function grains.square(n)
    result = 2^(n-1)
    return result
end

-- approach with a loop
function grains.total()
    result = 0
    for i = 1,64,1
    do
        result = result + grains.square(i)
    end
    return result
end

-- recursive approach; won't work
function grains.totalTill(n)
    next = n-1
    result = grains.square(n) + grains.totalTill(next)
    return result
end

function grains.totalRecursive()
    result = grains.totalTill(64)
    return result
end

return grains
