local triangle = {}

function triangle.kind(a, b, c)
    -- classifies a triangle as:
    -- equilateral all three same
    -- isosceles: two sides same
    -- scalene: all three different
    -- needs to return a string
    -- error handling: sum of any two sides must be >= the third side
    -- error handling: all sides must be > 0
    assert(a > 0 and b > 0 and c >0, "Input Error")
    assert(a + b >= c and a + c >= b and b + c >= a, 'Input Error')
    if a == b and a == c then return "equilateral" end
    if a == b or b == c or a == c then return "isosceles" end
    return "scalene"
end

return triangle