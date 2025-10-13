open System

// Функция для обработки списка чисел: вычисление суммы и нахождение максимального значения
let processNumbers numbers =
    match numbers with
    | [] -> 0, 0 // Если список пуст, возвращаем 0 для суммы и 0 для максимума
    | _ ->
        let sum = List.sum numbers
        let max = List.max numbers
        sum, max

[<EntryPoint>]
let main argv =
    // Пример списка чисел
    let numbers = [1; 5; -2; 8; 12; 3]

    // Обработка списка
    let total, maxValue = processNumbers numbers

    // Вывод результатов в консоль
    printfn "Список чисел: %A" numbers
    printfn "Сумма: %d" total
    printfn "Максимальное значение: %d" maxValue

    // Генерация случайного имени файла
    let random = Random()
    let fileName = sprintf "results_%d.txt" (random.Next(1000, 9999))

    // Формирование строки результата
    let resultString = sprintf "Список: %A\nСумма: %d\nМакс: %d" numbers total maxValue

    // Сохранение результата в файл
    System.IO.File.WriteAllText(fileName, resultString)
    printfn "Результаты сохранены в файл: %s" fileName

    0 // Код возврата для успешного завершения