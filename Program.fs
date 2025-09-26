open System
open System.IO

// Функция для обработки списка чисел: вычисляет сумму квадратов четных чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x % 2 = 0)  // Оставить только четные числа
    |> List.map (fun x -> x * x)         // Возвести их в квадрат
    |> List.sum                          // Найти сумму

// Пример входных данных
let inputNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Обработка
let result = processNumbers inputNumbers

// Генерация случайного имени файла
let randomFileName = Path.GetRandomFileName() + ".txt"

// Запись результата в файл
File.WriteAllText(randomFileName, sprintf "Входные числа: %A\nРезультат (сумма квадратов четных): %d" inputNumbers result)

printfn "Результат обработки сохранен в файл: %s" randomFileName
printfn "Результат: %d" result
