local function aliquot_sum(n)
  sum = 0  
  for i=1, n-1, 1 do
    if n % i == 0 then sum = sum + i end
  end
  return sum
end

local function classify(n)
  local aliquot_sum = aliquot_sum(n)
  if aliquot_sum == n then return "perfect" end
  if aliquot_sum > n then return "abundant" end
  if aliquot_sum < n then return "deficient" end   
end

return {
  aliquot_sum = aliquot_sum,
  classify = classify
}
