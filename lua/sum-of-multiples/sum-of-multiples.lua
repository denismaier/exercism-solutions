local function sum_of_multiples(numbers)
    return {
        to = function(max)
            sum = 0
            for candidate = 1, max -1, 1 do
                for _, base in ipairs(numbers) do
                    if candidate % base == 0 then 
                        sum = sum + candidate
                        break
                    end 
                end
            end
            return sum
        end
    }
end


return sum_of_multiples