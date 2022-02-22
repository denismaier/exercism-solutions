local function square_of_sum(n)
  local function worker (n, acc)
    if n == 0 then return acc end
    return worker(n-1, n+acc)
  end
  sum = worker(n, 0)
  return sum * sum
end

local function sum_of_squares(n)
  local function worker (n, acc)
    if n == 0 then return acc end
    return worker(n-1, acc + n^2)
  end
  return worker(n, 0)  
end

local function difference_of_squares(n)
  return square_of_sum(n) - sum_of_squares(n)
end

return {
  square_of_sum = square_of_sum,
  sum_of_squares = sum_of_squares,
  difference_of_squares = difference_of_squares
}
