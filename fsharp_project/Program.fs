open System

// Функция для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x > 0)  // Оставить только положительные числа
    |> List.map (fun x -> x * x)     // Возвести в квадрат
    |> List.sort                     // Отсортировать по возрастанию

[<EntryPoint>]
let main argv =
    let inputNumbers = [1; -2; 3; 4; -5; 6; 7; -8; 9; 0]
    let processedNumbers = processNumbers inputNumbers
    let result = String.concat ", " (List.map string processedNumbers)
    printfn "Обработанный список: [%s]" result

    // Генерация случайного имени файла
    let random = Random()
    let fileName = sprintf "output_%d.txt" (random.Next(1000, 9999))

    // Сохранение результата в файл
    System.IO.File.WriteAllText(fileName, result)
    printfn "Результат сохранен в файл: %s" fileName
    0