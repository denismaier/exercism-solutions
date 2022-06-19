function nth_prime_imp(n)
  if n <= 0 then error('invalid value') end
  primes = {}
  value = 1
  repeat
    value = value + 1
    if not is_multiple_of_collected_values(value, primes) and is_prime(value) then 
      table.insert(primes, value) 
    end
    until #primes == n
  return value
end

function nth_prime_rec(n)
  if n <= 0 then error('invalid value') end
  function nth_prime_worker(test, target, acc)
    if is_prime(test) then 
      if acc + 1 == target then return test end
      return nth_prime_worker(test+1, target, acc+1) 
    end
    return nth_prime_worker(test+1, target, acc)
  end
  return nth_prime_worker(1, n, 0)  
end

function is_prime(n)  
  if n == 1 then return false end
  for i=2, n-1, 1 do
    if n % i == 0 then return false end
  end
  return true
end

function is_multiple_of_collected_values(a, list)
  if #list == 0 then return false end
  for _,v in ipairs(list) do 
    if a % v == 0 then return true end
  end
  return false
end

return nth_prime_imp