module Accumulate

let accumulate func input =
    let rec handler func input acc =
        match input with
        | []        -> acc
        | x::xs     -> handler func xs (func x :: acc)
    handler func input []
    |> List.rev


let rec accumulate' func input =
    match input with
    | []        -> []
    | x::xs     -> (func x :: (accumulate func xs))
