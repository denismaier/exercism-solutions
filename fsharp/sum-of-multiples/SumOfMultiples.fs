module SumOfMultiples

let multiplesTillOf' upperBound step = 
    step
    |> Seq.unfold (fun value ->
        if (value >= upperBound) then
            None
        else
            Some(value, value + step))
let sum' (numbers: int list) (upperBound: int): int = 
    numbers
    |> List.filter ((<) 0)
    |> List.map (multiplesTillOf' upperBound)
    |> List.fold Seq.append Seq.empty
    |> Seq.distinct 
    |> Seq.sum

let multiplesTillOf upperbound step =
    seq {step..step..upperbound-1}

let sum (numbers: int list) (upperBound: int): int = 
    numbers
    |> List.filter ((<) 0)
    |> Seq.collect (multiplesTillOf upperBound) // this is basically mapping and folding in one go
    |> Seq.distinct 
    |> Seq.sum