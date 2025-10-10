open System

// Список чисел для обработки
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Функция для вычисления квадрата числа
let square x = x * x

// Функция для фильтрации четных чисел
let isEven x = x % 2 = 0

// Применяем фильтрацию и преобразование
let processedNumbers = 
    numbers
    |> List.filter isEven  // Оставляем только четные числа
    |> List.map square      // Вычисляем квадрат каждого числа

// Выводим результаты в консоль
printfn "Оригинальный список: %A" numbers
printfn "Четные числа: %A" (List.filter isEven numbers)
printfn "Квадраты четных чисел: %A" processedNumbers

// Сохраняем результаты в строку
let outputString = sprintf "Оригинальный список: %A\nЧетные числа: %A\nКвадраты четных чисел: %A" numbers (List.filter isEven numbers) processedNumbers

// Генерируем случайное имя файла
let random = Random()
let fileName = sprintf "/workspace/processed_numbers_%d.txt" random.Next

// Сохраняем строку в файл
System.IO.File.WriteAllText(fileName, outputString)
printfn "Результаты сохранены в файл: %s" fileName
