module CollatzConjecture

let steps (number: int): int option =
    let rec worker number acc = 
        match number with
        | 1                 -> acc
        | x when x % 2 = 0  -> worker (x / 2) (acc + 1)
        | x                 -> worker (x * 3+1) (acc + 1)
    match number with
        | x when x < 1 -> None
        | _ -> Some (worker number 0)
