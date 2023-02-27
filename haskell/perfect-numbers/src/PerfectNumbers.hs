module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify' :: Int -> Maybe Classification
classify' x
  | x < 1 = Nothing
  | comparison == LT = Just Deficient
  | comparison == EQ = Just Perfect
  | comparison == GT = Just Abundant
    where
      aliquotSum = sum [ y | y <- [1..x-1], mod x y == 0]
      comparison = compare aliquotSum x
    
classify''' :: Int -> Maybe Classification
classify''' x
  | x < 1 = Nothing
  | otherwise = case (compare aliquotSum x) of
      LT -> Just Deficient
      EQ -> Just Perfect
      GT -> Just Abundant
  where
    aliquotSum = sum [y | y <- [1..x-1], mod x y == 0]
  
classify'' :: Int -> Maybe Classification
classify'' x = 
  case x < 1 of
    True  -> Nothing
    False -> case compare aliquotSum x of 
      LT -> Just Deficient
      EQ -> Just Perfect
      GT -> Just Abundant
  where
    aliquotSum = sum [y | y <- [1..x-1], mod x y == 0]

classify = classify''