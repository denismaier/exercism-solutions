local function to_decimal(input)
  if input:find('%D') then return 0 end
  local function recursive_worker(input, factor, acc)
    if #input == 0 then return acc end
    partial_result = tonumber(input:sub(1,1)) * 2^factor
    return recursive_worker(input:sub(2), factor-1, acc + partial_result)
  end
  return recursive_worker(input, #input - 1, 0)
  end


return {
  to_decimal = to_decimal
}

-- A number 23 in base 10 notation can be understood
-- as a linear combination of powers of 10:

-- - The rightmost digit gets multiplied by 10^0 = 1
-- - The next number gets multiplied by 10^1 = 10
-- - ...
-- - The *n*th number gets multiplied by 10^*(n-1)*.
-- - All these values are summed.

-- So: `23 => 2*10^1 + 3*10^0 => 2*10 + 3*1 = 23 base 10`

-- Binary is similar, but uses powers of 2 rather than powers of 10.

-- So: `101 => 1*2^2 + 0*2^1 + 1*2^0 => 1*4 + 0*2 + 1*1 => 4 + 1 => 5 base 10`.