module PizzaPricing

// TODO: please define the 'Pizza' discriminated union type
type Pizza = 
    | Margherita
    | Caprese
    | Formaggio
    | ExtraSauce of Pizza
    | ExtraToppings of Pizza

let rec pizzaPrice (pizza: Pizza): int = 
    match pizza with
    | Margherita -> 7
    | Caprese -> 9
    | Formaggio -> 10
    | ExtraSauce pizza-> pizzaPrice pizza + 1
    | ExtraToppings pizza -> pizzaPrice pizza + 2

let orderPrice(pizzas: Pizza list): int = 
    let additionalFee (pizzas: Pizza list): int =
        match (List.length pizzas) with
        | 1 -> 3
        | 2 -> 2
        | _ -> 0
    List.map pizzaPrice pizzas |> List.sum |> (+) (additionalFee pizzas)
