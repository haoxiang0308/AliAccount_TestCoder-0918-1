// F# program to process a list of numbers

// Sample list of numbers
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 15; 20; 25]

// Function to calculate the sum of numbers
let sumNumbers lst = 
    lst |> List.sum

// Function to calculate the average of numbers
let averageNumbers lst =
    if List.isEmpty lst then 0.0
    else 
        let sum = lst |> List.sum
        float sum / float (List.length lst)

// Function to find the maximum number
let maxNumber lst =
    match lst with
    | [] -> None
    | _ -> Some (lst |> List.max)

// Function to find the minimum number
let minNumber lst =
    match lst with
    | [] -> None
    | _ -> Some (lst |> List.min)

// Function to filter even numbers
let evenNumbers lst =
    lst |> List.filter (fun x -> x % 2 = 0)

// Function to filter odd numbers
let oddNumbers lst =
    lst |> List.filter (fun x -> x % 2 <> 0)

// Processing the numbers
let sum = sumNumbers numbers
let avg = averageNumbers numbers
let max = maxNumber numbers
let min = minNumber numbers
let evens = evenNumbers numbers
let odds = oddNumbers numbers

// Display results
printfn "Original list: %A" numbers
printfn "Sum: %d" sum
printfn "Average: %.2f" avg
printfn "Maximum: %A" max
printfn "Minimum: %A" min
printfn "Even numbers: %A" evens
printfn "Odd numbers: %A" odds

// Additional processing: square each number
let squaredNumbers = numbers |> List.map (fun x -> x * x)
printfn "Squared numbers: %A" squaredNumbers