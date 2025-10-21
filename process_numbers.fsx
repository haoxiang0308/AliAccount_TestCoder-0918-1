// F# program to process a list of numbers and save to a file with random name

open System
open System.IO

// Function to generate a random filename
let generateRandomFileName extension =
    let random = Random()
    let chars = "abcdefghijklmnopqrstuvwxyz0123456789"
    let fileName = 
        [1..10] 
        |> List.map (fun _ -> chars.[random.Next(chars.Length)])
        |> List.toArray
        |> String
    sprintf "%s%s" fileName extension

// Function to process a list of numbers (example: calculate sum, average, and square each number)
let processNumbers numbers =
    let sum = List.sum numbers
    let avg = List.average (List.map float numbers)
    let squared = List.map (fun x -> x * x) numbers
    (sum, avg, squared)

// Original list of numbers to process
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let sum, avg, squared = processNumbers numbers

// Display results to console
printfn "Original numbers: %A" numbers
printfn "Sum: %d" sum
printfn "Average: %f" avg
printfn "Squared numbers: %A" squared

// Generate a random filename
let fileName = generateRandomFileName ".txt"

// Create content to save
let content = 
    sprintf "Original numbers: %A\nSum: %d\nAverage: %f\nSquared numbers: %A" 
        numbers sum avg squared

// Write the processed data to the file
File.WriteAllText(fileName, content)

printfn "Results saved to file: %s" fileName