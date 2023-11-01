{-# LANGUAGE ViewPatterns #-}

module Yacht (yacht, Category(..)) where

import Data.List
import Data.MultiSet (occur, distinctSize, toAscList, toOccurList, toAscOccurList, elems)

import qualified Data.MultiSet as MS

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht


yacht :: Category -> [Int] -> Int
yacht category (MS.fromList -> dice) = 
  case category of
    Yacht          | distinctSize dice == 1  -> 50
    FullHouse      | sort (map snd (toOccurList dice)) == [2,3]  -> sum $ elems dice
    FourOfAKind    | (d, m) <- getMostFrequent, m >= 4 -> 4 * d
    LittleStraight | toAscList dice == [1,2,3,4,5]  -> 30
    BigStraight    | toAscList dice == [2,3,4,5,6]  -> 30
    Choice         -> sum dice
    Ones           -> sumOfNum 1
    Twos           -> sumOfNum 2
    Threes         -> sumOfNum 3
    Fours          -> sumOfNum 4
    Fives          -> sumOfNum 5
    Sixes          -> sumOfNum 6
    _              -> 0
  where
    sumOfNum x = x * occur x dice
    getMostFrequent = last $ sortOn snd $ toAscOccurList dice


yacht'' :: Category -> [Int] -> Int
yacht'' category (MS.fromList -> dice) = 
  case category of
    Yacht          -> evalYacht
    FullHouse      -> evalFullHouse
    FourOfAKind    -> evalFourOfAKind
    LittleStraight -> evalLittleStraight
    BigStraight    -> evalBigStraight
    Choice         -> sum dice
    Ones           -> sumOfNum 1
    Twos           -> sumOfNum 2
    Threes         -> sumOfNum 3
    Fours          -> sumOfNum 4
    Fives          -> sumOfNum 5
    Sixes          -> sumOfNum 6
  where
    sumOfNum x = x * occur x dice

    evalYacht = case distinctSize dice of
      1 -> 50
      _ -> 0
    
    evalFullHouse = case sortOn snd (toOccurList dice) of
      [(_,2),(_,3)] -> sum $ elems dice
      _ -> 0

    evalFourOfAKind = case toOccurList dice of
      [(_,1),(x,4)] -> x * 4
      [(x,4),(_,1)] -> x * 4
      [(x,5)]       -> x * 4
      _             -> 0

    evalLittleStraight = case toOccurList dice of 
      [(1,1),_,_,_,(5,1)] -> 30 
      _                   -> 0

    evalBigStraight = case toOccurList dice of 
      [(2,1),_,_,_,(6,1)] -> 30 
      _                   -> 0



yacht' :: Category -> [Int] -> Int
yacht' category (sort -> dice) = 
  case category of
    Yacht          -> evalYacht
    FullHouse      -> evalFullHouse
    FourOfAKind    -> evalFourOfAKind
    LittleStraight -> evalLittleStraight
    BigStraight    -> evalBigStraight
    Choice         -> sum dice
    Ones           -> sumOfNum 1
    Twos           -> sumOfNum 2
    Threes         -> sumOfNum 3
    Fours          -> sumOfNum 4
    Fives          -> sumOfNum 5
    Sixes          -> sumOfNum 6    
  where
    groups = (sortOn length . group) dice
    sumOfNum x = sum $ filter (== x) dice

    evalYacht = case groups of
      [[_,_,_,_,_]] -> 50 
      _             -> 0

    evalFullHouse = case groups of
      [xs@[_,_],ys@[_,_,_]] -> sum $ xs ++ ys
      _                     -> 0

    evalFourOfAKind = case groups of
      [[x,_,_,_,_]]    -> x * 4
      [[_],[x,_,_,_]]  -> x * 4
      _                -> 0
      
    evalLittleStraight = if dice == [1,2,3,4,5] then 30 else 0

    evalBigStraight = if dice == [2,3,4,5,6] then 30 else 0
