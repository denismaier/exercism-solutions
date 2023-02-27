module TwoFer

let twoFer (input: string option): string =
    let name = 
        match input with 
        | None -> "you"
        | Some name-> name
    $"One for {name}, one for me."