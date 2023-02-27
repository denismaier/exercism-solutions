module TisburyTreasureHunt

let getCoordinate (line: string * string): string =
    snd line

let convertCoordinate (coordinate: string): int * char = 
    (coordinate[0] |> string |> int, coordinate[1])

let compareRecords (azarasData: string * string) (ruisData: string * (int * char) * string) : bool = 
    let azarasCoordinates = convertCoordinate (getCoordinate azarasData)
    let (_, ruisCoordinates, _) = ruisData
    azarasCoordinates =  ruisCoordinates

let createRecord (azarasData: string * string) (ruisData: string * (int * char) * string) : (string * string * string * string) =
    if (compareRecords azarasData ruisData) = true then
        let (treasure, coordinates) = azarasData
        let (location, _, quadrant) = ruisData
        (coordinates, location, quadrant, treasure)
    else
        ("", "", "", "")
        
