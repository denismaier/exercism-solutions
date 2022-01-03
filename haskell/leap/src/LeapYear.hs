module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear' year = if (mod year 4 == 0 && (mod year 100 /= 0 || mod year 400 == 0)) then True else False

isLeapYear'' year
  | mod year 4 == 0 && (mod year 100 /= 0 || mod year 400 == 0) = True
  | otherwise = False


isLeapYear''' year
  | mod year 400 == 0 = True
  | mod year 4 == 0 && mod year 100 /= 0 = True
  | otherwise = False

isLeapYear year
  | isDivisibleByZero year 400 == True = True
  | isDivisibleByZero year 4 == True && isDivisibleByZero year 100 == False = True
  | otherwise = False
  where 
    isDivisibleByZero x y 
      | mod x y == 0 = True
      | otherwise = False
