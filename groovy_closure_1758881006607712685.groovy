// Замыкание для фильтрации списка чисел, оставляющее только четные
def filterEven = { list ->
    return list.findAll { it % 2 == 0 }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEven(numbers)

println "Оригинальный список: $numbers"
println "Отфильтрованный список (четные): $evenNumbers"

// Замыкание для фильтрации строк по длине
def filterByLength = { minLength, list ->
    return list.findAll { it.length() >= minLength }
}

def words = ["apple", "hi", "banana", "a", "elephant"]
def longWords = filterByLength(5, words)

println "Оригинальный список строк: $words"
println "Отфильтрованный список (длина >= 5): $longWords"