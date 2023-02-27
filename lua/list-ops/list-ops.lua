local function reduce(xs, acc, f)
  for _, v in ipairs(xs) do
    acc = f(v, acc)
  end
  return acc
end

local function map(xs, f)
  result = {}
  for _, v in ipairs(xs) do
    table.insert(result, f(v))
  end
  return result
end

local function filter(xs, pred)
  result = {}
  for _, v in ipairs(xs) do
    if pred(v) then table.insert(result, v) end
  end
  return result
end

local function map_via_reduce (xs, f)
  return reduce(xs, {}, function (x, acc)
    table.insert(acc, f(x))
    return acc
  end)
end

local function filter_via_reduce (xs, f)
  return reduce(xs, {}, function (x, acc)
    if f(x) then table.insert(acc, x) end 
    return acc
  end)
end



return {
  map = map_via_reduce,
  reduce = reduce,
  filter = filter_via_reduce
}
