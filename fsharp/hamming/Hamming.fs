module Hamming

let distanceRec (strand1: string) (strand2: string): int option = 
    let rec compare strand1 strand2 acc = 
        match strand1, strand2 with
        | [], [] -> acc
        | x::xs, y::ys -> 
            match x = y with
            | true -> compare xs ys acc
            | false -> compare xs ys (acc + 1)
        | _, _ -> 0
    match strand1.Length = strand2.Length with
    | true-> Some (compare (strand1 |> Seq.toList) (strand2 |> Seq.toList) 0)
    | _ -> None

let distanceZip (strand1: string) (strand2: string) =
    match strand1.Length = strand2.Length with
    | true-> 
        Seq.zip strand1 strand2
        |> Seq.filter (fun (x, y) -> x <> y)
        |> Seq.length
        |> Some      
    | _ -> None

let distance = distanceZip