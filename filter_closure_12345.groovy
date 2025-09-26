// Замыкание для фильтрации списка
def filterNumbers = { list ->
    return list.findAll { it % 2 == 0 } // Фильтр для четных чисел
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterNumbers(numbers)

println "Оригинальный список: $numbers"
println "Отфильтрованный список (четные числа): $evenNumbers"
