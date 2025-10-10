open System

// Пример списка чисел
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Функция для обработки списка: например, возведение в квадрат
let processNumbers lst =
    lst |> List.map (fun x -> x * x)

[<EntryPoint>]
let main argv =
    let processedNumbers = processNumbers numbers
    printfn "Original list: %A" numbers
    printfn "Processed list (squared): %A" processedNumbers

    // Сохранение в файл со случайным именем
    let random = Random()
    let fileName = sprintf "/workspace/output_%d.txt" (random.Next(1000, 9999))
    use file = new System.IO.StreamWriter(fileName)
    file.WriteLine("Original list:")
    file.WriteLine(sprintf "%A" numbers)
    file.WriteLine("Processed list (squared):")
    file.WriteLine(sprintf "%A" processedNumbers)

    printfn "Results saved to %s" fileName
    0 // Возврат кода завершения