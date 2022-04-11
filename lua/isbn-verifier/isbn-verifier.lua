function valid(isbn)
  -- normalize
  normalized_isbn = isbn:gsub('%-', ''):lower()
  if normalized_isbn:len() == 10 then return valid_10(normalized_isbn) end
  if normalized_isbn:len() == 13 then return valid_13(normalized_isbn) end
  return false
end

function valid_10(isbn)
  if isbn:find('[^0-9x]') then return false end
  if isbn:sub(1,-2):find('x') ~= nil then return false end
  local sum = 0
  local factor = 10
  for char in string.gmatch(isbn, ".") do
    local num
    if char == 'x' then num = 10
    else num = tonumber(char)
    end
    sum = sum + (factor * num)
    factor = factor - 1
  end
  return sum % 11 == 0
end

function valid_13(isbn)
  if isbn:find('[^0-9]') then return false end
  local sum = 0
  local lastdigit = tonumber(isbn:sub(-1))
  for i = 1, 11, 2 do
    sum = sum + tonumber(isbn:sub(i, i))
  end
  for i = 2, 12, 2 do
    sum = sum + (tonumber(isbn:sub(i, i)) * 3)
  end
  checksum = (10 - (sum % 10)) % 10
  return checksum == lastdigit
end

return {valid = valid}