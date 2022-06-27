local function is_even(n)
    return n % 2 == 0
end

local function conjecture(n, acc)
    assert (n > 0, 'Only positive numbers are allowed')
    local acc = acc or 0
    -- base case
    if n == 1 then return acc end
    -- update accumulator
    local next_acc = acc + 1
    -- odd/even handling
    if is_even(n) then 
        return conjecture(n/2, next_acc) 
    else
        return conjecture(n*3+1, next_acc)
    end
end


return conjecture
