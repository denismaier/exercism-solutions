local Hamming = {}

function Hamming.compute_loop(a,b)
    if #a ~= #b then return -1 end
    local difference = 0 
    if a == b then return difference end
    for i=1, #a, 1 do
        if a:byte(i) ~= b:byte(i) then difference = difference + 1 end
    end 
    return difference
end

function Hamming.compute_recursion(a,b)
    if #a ~= #b then return -1 end
    local function compute_worker(a,b, acc)
        if #a == 0 or a == b then return acc end
        if a:byte(1) == b:byte(1) then return compute_worker(a:sub(2), b:sub(2), acc) end
        return compute_worker(a:sub(2), b:sub(2), acc + 1)
    end
    return compute_worker(a, b, 0)
end

Hamming.compute = Hamming.compute_recursion
-- Hamming.compute = Hamming.compute_loop

return Hamming
