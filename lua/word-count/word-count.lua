local function word_count(s)
  -- normalize
  s = s:lower()
  -- normalize whitespace
  s = string.gsub(s, "%s", " ")
  -- remove trailing single quotes
  -- s = string.gsub(s, "%A'%A", "") -- does not work, why?
  -- so remove trailing single quotes one be
  s = string.gsub(s, "%s'", " ")
  s = string.gsub(s, "'%s", " ")
  s = string.gsub(s, "^'", "")
  s = string.gsub(s, "'$", "")
  --
  results = {}
  pattern = "[%a%d']+"
  for word in string.gmatch(s, pattern) do
    if results[word] == nil then 
      results[word] = 1 
    else
      results[word] = results[word] + 1
    end
  end
  return results
end

return {
  word_count = word_count,
}
