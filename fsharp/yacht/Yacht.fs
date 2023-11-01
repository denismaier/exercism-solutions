module Yacht

type Category = 
    | Ones
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

type Die =
    | One 
    | Two 
    | Three
    | Four 
    | Five 
    | Six

let dieToNumber = function
  | Die.One   -> 1
  | Die.Two   -> 2
  | Die.Three -> 3
  | Die.Four  -> 4
  | Die.Five  -> 5
  | Die.Six   -> 6

let score category dice = 
    let intDice = List.map dieToNumber dice
    
    let sorted = List.sort intDice
    
    let grouped =
        intDice |> List.countBy id |> List.sortByDescending snd

    let evalFullHouse = 
      match grouped with
        | [(_, 3); (_, 2)] -> List.sum intDice
        | _                -> 0

    let evalFourOfAKind = 
      match grouped with
        | [(a, 4); (_, 1)] -> 4 * a
        | [(a, 5)]         -> 4 * a
        | _                -> 0

    let evalLittleStraight = 
      match sorted with
      | [1;2;3;4;5] -> 30
      | _           -> 0

    let evalBibStraight = 
      match sorted with
      | [2;3;4;5;6] -> 30
      | _           -> 0

    let evalChoice = List.sum intDice

    let evalYacht = 
      match grouped with 
        | [(_,5)]  -> 50
        | _        -> 0

    let sumOfNum =
      let targetNum = 
            match category with
              | Ones   -> 1
              | Twos   -> 2
              | Threes -> 3
              | Fours  -> 4
              | Fives  -> 5
              | _      -> 6
      intDice |> List.filter ((=) targetNum) |> List.sum

    match category with
    | Ones | Twos | Threes | Fours | Fives | Sixes -> sumOfNum
    | FullHouse      -> evalFullHouse
    | FourOfAKind    -> evalFourOfAKind
    | LittleStraight -> evalLittleStraight
    | BigStraight    -> evalBibStraight
    | Choice         -> evalChoice
    | Yacht          -> evalYacht