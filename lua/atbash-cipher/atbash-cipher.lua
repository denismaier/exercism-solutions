
local mapping = {
  a = "z",
  b = "y",
  c = "x",
  d = "w",
  e = "v",
  f = "u",
  g = "t",
  h = "s",
  i = "r",
  j = "q",
  k = "p",
  l = "o",
  m = "n",
  n = "m",
  o = "l",
  p = "k",
  q = "j",
  r = "i",
  s = "h",
  t = "g",
  u = "f",
  v = "e",
  w = "d",
  x = "c",
  y = "b",
  z = "a",
}

function encode(str)
  --normalize
  str = str:lower()
  str = str:gsub("%W", "")
  -- transpose and format
  return string_to_chunks(transpose(str), 5) 
end

function transpose (str)
  local letters = {}
  for char in string.gmatch(str, ".") do 
    if char:find('%a') then table.insert(letters, mapping[char]) end
    if char:find('%d') then table.insert(letters, char) end
  end
  return table.concat(letters)
end

function string_to_chunks(str, size)
  local chunks = {}
  for i=1, #str, size do
    table.insert(chunks, str:sub(i, i+size-1))
  end
  return table.concat(chunks, ' ')
end

return { encode = encode }