module Grains (square, total) where
import Control.Applicative
import Data.Maybe

square :: Integer -> Maybe Integer
square n 
  | n <1 || n > 64 = Nothing
  | otherwise = Just $ 2^(n-1)
      
total :: Integer
total = fromJust $ grainsOnBoardAtSquare 64
  where
    grainsOnBoardAtSquare :: Integer -> Maybe Integer
    grainsOnBoardAtSquare 1 = Just 1
    grainsOnBoardAtSquare n = liftA2 (+) (square n) (grainsOnBoardAtSquare (n-1))
      
total' :: Integer
total' = grainsOnBoardAtSquare 64
  where
    grainsOnBoardAtSquare 1 = 1
    grainsOnBoardAtSquare n = fromJust (square n) + grainsOnBoardAtSquare (n-1)
      
total'' :: Integer
total'' = sum $ map fromJust $ map square [1..64]

total''' :: Integer
total''' = sum $ map (\n -> 2^(n-1)) [1..64]