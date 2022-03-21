local function word_count(s)
  -- normalize
  s = s:lower()
  -- normalize whitespace
  s = s:gsub("%s", " ")
  -- remove trailing single quotes
  s = s:gsub("%s'", " "):gsub("^'", "")
  s = s:gsub("'%s", " "):gsub("'$", "")
  --
  results = {}
  pattern = "[%w']+"
  for word in string.gmatch(s, pattern) do
    results[word] = (results[word] or 0) + 1
  end
  return results
end

return {
  word_count = word_count,
}
