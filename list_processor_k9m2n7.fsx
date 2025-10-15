// F# program to process a list of numbers with various operations

open System

// Sample list of numbers
let numberList = [3; 7; 12; 18; 23; 35; 42; 56; 63; 77; 84; 91]

// Function to calculate product of all numbers (for smaller lists to avoid overflow)
let productNumbers lst = 
    if List.length lst > 10 then 
        printfn "List too large for product calculation"
        None
    else 
        Some (lst |> List.fold (*) 1)

// Function to find numbers greater than a given value
let numbersGreaterThan lst threshold =
    lst |> List.filter (fun x -> x > threshold)

// Function to calculate standard deviation
let stdDev lst =
    let avg = List.average (List.map float lst)
    let variance = lst |> List.map (fun x -> (float x - avg) ** 2.) |> List.average
    sqrt variance

// Function to get unique numbers (in case of duplicates)
let uniqueNumbers lst =
    lst |> List.distinct

// Function to sort the list in ascending order
let sortedAsc lst =
    lst |> List.sort

// Function to sort the list in descending order
let sortedDesc lst =
    lst |> List.sortWith (fun a b -> compare b a)

// Processing the list
let prod = productNumbers numberList
let greaterThan50 = numbersGreaterThan numberList 50
let deviation = stdDev numberList
let unique = uniqueNumbers numberList
let sortedAscending = sortedAsc numberList
let sortedDescending = sortedDesc numberList

// Print results
printfn "Original list: %A" numberList
printfn "Product (if calculable): %A" prod
printfn "Numbers greater than 50: %A" greaterThan50
printfn "Standard deviation: %.2f" deviation
printfn "Unique numbers: %A" unique
printfn "Sorted ascending: %A" sortedAscending
printfn "Sorted descending: %A" sortedDescending

// Calculate cumulative sum
let cumulativeSum = 
    numberList 
    |> List.scan (+) 0
    |> List.tail  // Remove the initial 0
printfn "Cumulative sum: %A" cumulativeSum