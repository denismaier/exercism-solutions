"""Calculate the number of grains on square `square`."""
function on_square(square)
    if square < 1 || square > 64
        throw(DomainError(""))
    end
    return 2^(square-1) 
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    if square < 1 || square > 64
        throw(DomainError(""))
    end
    sum = 0
    for i in 1:square
        sum = sum + on_square(square)
    end
    return sum
end
