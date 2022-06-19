local bob = {}

function bob.hey(say)
  if say == "" then return 'Fine, be that way.' end
  normalized = say:gsub('%A', '')
  is_all_uppercase = string.len(normalized:gsub('%u', '')) == 0
  last_char = say:sub(-1)
  if last_char == '?' and is_all_uppercase then return 'Calm down, I know what I\'m doing!' end
  if last_char == '?' then return 'Sure' end
  if is_all_uppercase == true then return 'Whoa, chill out!' end
  return 'Whatever'
end

return bob