local function matrix(str)
  -- build matrix
  local matrix = {}
  for linestr in string.gmatch(str, "[^\n]+") do
    local line = {}
    for num in string.gmatch(linestr, "%d+") do
      table.insert(line, tonumber(num))
    end
    table.insert(matrix, line)
  end
  
  -- accessor functions
  local function get_row(n)
    return matrix[n]
  end

  local function get_column(n)
    local column = {}
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