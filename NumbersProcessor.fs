open System

// Функция для обработки списка чисел: вычисляет сумму квадратов четных чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x % 2 = 0)  // Фильтруем четные числа
    |> List.map (fun x -> x * x)         // Возводим в квадрат
    |> List.sum                          // Суммируем

[<EntryPoint>]
let main argv =
    let sampleList = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    let result = processNumbers sampleList
    printfn "Сумма квадратов четных чисел из %A равна %d" sampleList result
    0