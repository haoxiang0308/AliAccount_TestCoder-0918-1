// Замыкание для фильтрации списка четных чисел
def filterEvenNumbers = { list ->
    return list.findAll { it % 2 == 0 }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEvenNumbers(numbers)
println "Оригинальный список: ${numbers}"
println "Четные числа: ${evenNumbers}"

// Замыкание также можно использовать для других условий фильтрации
def filterGreaterThanFive = { list ->
    return list.findAll { it > 5 }
}

def numbersGreaterThanFive = filterGreaterThanFive(numbers)
println "Числа больше 5: ${numbersGreaterThanFive}"