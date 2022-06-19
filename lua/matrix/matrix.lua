function matrix(str)
  -- build matrix
  local matrix = {}
  for linestr in string.gmatch(str, "[^\n]+") do
    line = {}
    for num in string.gmatch(linestr, "%d+") do
      line[#line + 1] = tonumber(num)
    end
    matrix[#matrix+1] = line
  end
  
  -- accessor functions
  local function get_row(n)
    return matrix[n]
  end

  local function get_column(n)
    column = {}
    for _, row in ipairs(matrix) do
      table.insert(column, row[n])
    end
    return column
  end

  -- return accessor functions
  return {
    row = get_row,
    column = get_column,
  }
end


return matrix