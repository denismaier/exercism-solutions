local function to_decimal(input)
  if input:match('%D') then return 0 end
  local function recursive_worker(input, factor, acc)
    if #input == 0 then return acc end
    local partial_result = tonumber(input:sub(1,1)) * 2^factor
    return recursive_worker(input:sub(2), factor-1, acc + partial_result)
  end
  return recursive_worker(input, #input - 1, 0)
  end


return {
  to_decimal = to_decimal
}