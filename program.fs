open System
open System.IO

// Функция для обработки списка чисел: находит сумму, произведение и среднее значение
let processNumbers numbers =
    match numbers with
    | [] -> (0, 0, 0.0) // Если список пуст, возвращаем нули
    | _ ->
        let sum = List.sum numbers
        let product = List.fold (*) 1 numbers // Используем fold для вычисления произведения
        let average = (float sum) / (float (List.length numbers)) // Среднее как float
        (sum, product, average)

// Основная функция
[<EntryPoint>]
let main argv =
    // Пример списка чисел
    let numbers = [1; 2; 3; 4; 5]

    // Обрабатываем список
    let sum, product, average = processNumbers numbers

    // Генерируем случайное имя файла
    let random = Random()
    let fileName = sprintf "output_%d.txt" (random.Next(1000, 9999))

    // Формируем строку с результатами
    let results = sprintf "Список: %A\nСумма: %d\nПроизведение: %d\nСреднее: %.2f\n" numbers sum product average

    // Выводим результаты в консоль
    printfn "%s" results

    // Сохраняем результаты в файл со случайным именем
    File.WriteAllText(fileName, results)
    printfn "Результаты сохранены в файл: %s" fileName

    0 // Возвращаем код завершения