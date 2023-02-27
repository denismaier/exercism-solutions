module Grains

let square (n: int): Result<uint64,string> = 
    match n with
    | n when n < 1 || n > 64 -> Error "square must be between 1 and 64"
    | n -> Ok (uint64 (bigint 2 ** (n - 1)))

let total': Result<uint64,string> = 
    let value = (bigint 2) ** 64 - (bigint 1)
    Ok (uint64 value)

let total'': Result<uint64,string> = 
    let safeSquare (n: int): uint64 = uint64 (bigint 2 ** (n - 1))
    seq {1 .. 64}
    |> Seq.map safeSquare
    |> Seq.sum
    |> Ok

let total''': Result<uint64,string> = 
    seq {1 .. 64}
    |> Seq.map square
    |> Seq.map Result.toOption
    |> Seq.map Option.get
    |> Seq.sum
    |> Ok

let total'''': Result<uint64,string> = 
    seq {1 .. 64}
    |> Seq.map square
    |> Seq.reduce (fun x y ->
        match (x, y) with 
        | (Ok a, Ok b) -> Ok (a + b)
        | _ -> Error "Can't compute sum"
        )

let liftA2 f x y =
    match (x, y) with 
        | (Ok a, Ok b) -> Ok (f a b)
        | (Ok a, Error e) -> Error e
        | _, _ -> Error "This should not happen"
    
let total''''': Result<uint64,string> = 
    seq {1 .. 64}
    |> Seq.map square
    |> Seq.reduce (liftA2 (+))


let traverseResultM f list =
    // copied from https://fsharpforfunandprofit.com/posts/elevated-world-4/

    // define the monadic functions
    let (>>=) x f = Result.bind f x
    let retn = Result.Ok

    // define a "cons" function
    let cons head tail = head :: tail

    // right fold over the list
    let initState = retn []
    let folder head tail =
        f head >>= (fun h ->
        tail >>= (fun t ->
        retn (cons h t) ))

    List.foldBack folder list initState

let total'''''' = 
    match [1 .. 64] |> traverseResultM square with 
        | Ok lst -> Ok (List.sum lst)
        | Error e -> Error e

let total = total''''''