// Пример программы на F# для обработки списка чисел
// В данном случае программа вычисляет сумму квадратов четных чисел

open System

let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

let sumOfSquaresOfEvens =
    numbers
    |> List.filter (fun x -> x % 2 = 0)
    |> List.map (fun x -> x * x)
    |> List.sum

printfn "Сумма квадратов четных чисел: %d" sumOfSquaresOfEvens

// Сохранение результата в файл со случайным именем
let fileName = System.IO.Path.GetRandomFileName() + ".txt"
System.IO.File.WriteAllText(fileName, sprintf "Сумма квадратов четных чисел: %d" sumOfSquaresOfEvens)
printfn "Результат сохранен в файл: %s" fileName