--helpers 

local function is_multiple_of_list_member(a, list)
  if #list == 0 then return false end
  for _,v in ipairs(list) do
    if a % v == 0 then return true end
    if v * v >= a then return false end
  end
  return false
end

local function add_next_prime(list_of_primes)
  local last_prime = list_of_primes[#list_of_primes]
  local candidate = last_prime + 1
  while is_multiple_of_list_member(candidate, list_of_primes) do
    candidate = candidate + 1
  end
  table.insert(list_of_primes, candidate)
  return (list_of_primes)
end

local function is_prime(n)
  for i = 2, math.sqrt(n), 1 do
    if n % i == 0 then return false end
  end
  return true
end

-- implementations
local function nth_prime_via_loop(n)
  if n <= 0 then error('invalid value') end
  local primes = {}
  local value = 1
  repeat
    value = value + 1
    if not is_multiple_of_list_member(value, primes) then 
      table.insert(primes, value) 
    end
    until #primes == n
  return value
end

local function nth_prime_via_simple_loop(n)
  if n <= 0 then error('invalid value') end
  local counter = 0
  local candidate = 1
  while counter < n do
    candidate = candidate + 1
    if is_prime(candidate) then counter = counter + 1 end
  end
  return candidate
end


local function nth_prime_via_helper(n)
  if n <= 0 then error('invalid value') end
  local function worker(n, list_of_primes)
    if n == #list_of_primes then return list_of_primes[#list_of_primes] end
    return worker(n, add_next_prime(list_of_primes))
  end
  return worker(n, {2})  
end

-- return nth_prime_via_helper
return nth_prime_via_simple_loop
-- return nth_prime_via_loop