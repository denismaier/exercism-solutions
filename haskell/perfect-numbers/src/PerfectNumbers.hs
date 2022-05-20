module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x
  | x < 1 = Nothing
  | aliquotSum < x = Just Deficient
  | aliquotSum == x = Just Perfect
  | aliquotSum > x = Just Abundant
    where
      aliquotSum = foldl (+) 0 [ y | y <- [1..x-1], mod x y == 0]
