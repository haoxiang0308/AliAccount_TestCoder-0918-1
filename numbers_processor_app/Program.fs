// Функция для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x > 0)  // Оставить только положительные
    |> List.map (fun x -> x * x)     // Возвести в квадрат
    |> List.sortDescending         // Отсортировать по убыванию

// Пример входных данных
let inputNumbers = [ -2; 5; -1; 8; 0; 3; -5; 7 ]

// Обработка
let result = processNumbers inputNumbers

// Печать результата
printfn "Исходный список: %A" inputNumbers
printfn "Обработанный список: %A" result

// Сохранение результата в файл со случайным именем
open System
open System.IO

let randomFileName = Path.GetRandomFileName() + ".txt"
File.WriteAllText(randomFileName, sprintf "%A" result)

printfn "Результат сохранен в файл: %s" randomFileName