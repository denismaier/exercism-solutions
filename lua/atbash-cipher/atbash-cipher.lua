-- explicit declaration of mapping
-- local mapping = {
--   a = "z",
--   b = "y",
--   c = "x",
--   d = "w",
--   e = "v",
--   f = "u",
--   g = "t",
--   h = "s",
--   i = "r",
--   j = "q",
--   k = "p",
--   l = "o",
--   m = "n",
--   n = "m",
--   o = "l",
--   p = "k",
--   q = "j",
--   r = "i",
--   s = "h",
--   t = "g",
--   u = "f",
--   v = "e",
--   w = "d",
--   x = "c",
--   y = "b",
--   z = "a",
-- }

-- automatic generation of mapping

local letters = "abcdefghijklmnopqrstuvwxyz"
local reversed = string.reverse(letters)

local function make_mapping(src, dest)
  local mapping = {}
  for i = 1, #src do
    mapping[src:sub(i,i)] = dest:sub(i,i)
  end
  return mapping
end

local function transpose (str)
  local mapping = make_mapping(letters, reversed)
  local letters = {}
  for char in string.gmatch(str, ".") do 
    if char:match('%a') then table.insert(letters, mapping[char]) end
    if char:match('%d') then table.insert(letters, char) end
  end
  return table.concat(letters)
end

local function string_to_chunks(str, size)
  local chunks = {}
  for i=1, #str, size do
    table.insert(chunks, str:sub(i, i+size-1))
  end
  return table.concat(chunks, ' ')
end

local function encode(str)
  --normalize
  str = str:lower():gsub("%W", "")
  -- transpose and format
  return string_to_chunks(transpose(str), 5) 
end


return { encode = encode }
