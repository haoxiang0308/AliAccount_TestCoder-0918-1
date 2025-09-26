open System

// Функция для обработки списка чисел: вычисляет сумму квадратов четных чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x % 2 = 0) // Фильтруем четные числа
    |> List.map (fun x -> x * x)        // Возводим в квадрат
    |> List.sum                         // Суммируем

[<EntryPoint>]
let main argv =
    let sampleList = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    let result = processNumbers sampleList
    printfn "Список чисел: %A" sampleList
    printfn "Сумма квадратов четных чисел: %d" result

    // Сохраняем результат в файл со случайным именем
    let fileName = sprintf "output_%d.txt" (DateTime.Now.Ticks % 1000000L)
    let content = sprintf "Список: %A\nРезультат: %d" sampleList result
    System.IO.File.WriteAllText(fileName, content)
    printfn "Результат сохранен в файл: %s" fileName

    0 // Возвращаем код выхода