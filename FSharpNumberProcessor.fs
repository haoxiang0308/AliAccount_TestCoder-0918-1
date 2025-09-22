// Program.fs
// Программа для обработки списка чисел на F#

// Исходный список чисел
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Функция для обработки списка:
// 1. Фильтруем четные числа
// 2. Возводим их в квадрат
let processNumbers lst =
    lst
    |> List.filter (fun x -> x % 2 = 0)  // Оставляем только четные числа
    |> List.map (fun x -> x * x)         // Возводим каждое число в квадрат

// Обрабатываем список
let processedNumbers = processNumbers numbers

// Выводим результаты
printfn "Исходный список: %A" numbers
printfn "Обработанный список (четные числа в квадрате): %A" processedNumbers