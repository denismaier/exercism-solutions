module ListOps

let rec foldr folder state list = 
    match list with
    | [] -> state
    | x::xs -> folder x (foldr folder state xs)

let rec foldl folder state list = 
    match list with
    | [] -> state
    | x::xs -> foldl folder (folder state x) xs

let rec lengthRec list = 
    match list with 
    | [] -> 0
    | _ :: xs -> 1 + lengthRec xs

let lengthFold list = 
    foldl (fun acc _ -> acc + 1) 0 list

let length = lengthFold


//simple implemenation of reverse
let rec reverseRec list = 
    match list with
    | [] -> []
    | x::xs -> reverseRec xs @ [x]

// for longer lists better use a tail recursive version
let reverseTailRec list =
    let rec worker list acc =
        match list with
        | [] -> acc
        | x::xs -> worker xs (x::acc)
    worker list []

let reverseFold list =
    foldl (fun acc el -> el :: acc) [] list

let reverse = reverseFold

let rec mapRec f list = 
    match list with
    | [] -> []
    | x::xs -> f x :: mapRec f xs

let rec mapFold f list =
    foldr (fun x acc -> f x :: acc) [] list 

let map = mapFold

let rec filterRec f list = 
    match list with
    | [] -> []
    | x::xs -> if f x 
               then x :: filterRec f xs 
               else filterRec f xs

let filterFold f list =
    foldr (fun x acc -> if f x then x :: acc else acc) [] list

let filter = filterFold

let appendRec xs ys = 
    let rec worker xs ys =
        match xs with
        | [] -> ys
        | x :: xs -> worker xs (x :: ys)
    worker (reverse xs) ys

let appendFold list1 list2 =
    foldr (fun x acc -> x :: acc) list2 list1 

let append = appendFold

let rec concatRec xs =
  match xs with
  | [] -> []
  | x::xs -> append x (concatRec xs)


let concatFold xs = foldr append [] xs

let concat = concatFold