local bob = {}

local function is_question(str)
  return str:sub(-1) == '?'
end

local function is_shouting(str)
  normalized = str:gsub('%A', '')
  is_all_uppercase = string.len(normalized:gsub('%u', '')) == 0
  return is_all_uppercase
end

function bob.hey(say)
  if say == "" then return 'Fine, be that way.' end
  if is_question(say) and is_shouting(say) then return 'Calm down, I know what I\'m doing!' end
  if is_question(say) then return 'Sure' end
  if is_shouting(say) == true then return 'Whoa, chill out!' end
  return 'Whatever'
end

return bob