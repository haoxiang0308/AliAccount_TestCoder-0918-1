// Программа на F# для обработки списка чисел
// Фильтрация четных чисел и вычисление их суммы

// Открываем необходимые модули
open System

// Функция для фильтрации четных чисел
let filterEvenNumbers numbers =
    List.filter (fun x -> x % 2 = 0) numbers

// Функция для вычисления суммы чисел
let sumNumbers numbers =
    List.sum numbers

// Основная функция
[<EntryPoint>]
let main argv =
    // Исходный список чисел
    let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    
    printfn "Исходный список чисел: %A" numbers
    
    // Фильтруем четные числа
    let evenNumbers = filterEvenNumbers numbers
    printfn "Четные числа: %A" evenNumbers
    
    // Вычисляем сумму четных чисел
    let sum = sumNumbers evenNumbers
    printfn "Сумма четных чисел: %d" sum
    
    0 // Возвращаем код завершения