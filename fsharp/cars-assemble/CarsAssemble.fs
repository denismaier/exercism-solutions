module CarsAssemble

let successRate (speed: int): float =
    if speed >= 1 && speed <=4 then 1
    elif speed <=8 then 0.9
    elif speed = 9 then 0.8
    elif speed = 10 then 0.77
    else 0

let productionRatePerHour (speed: int): float  =
    float (speed * 221) * successRate speed

let workingItemsPerMinute (speed: int): int =
    int (productionRatePerHour speed) / 60
