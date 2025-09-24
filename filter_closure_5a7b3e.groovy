// Замыкание для фильтрации списка чисел по заданному условию (например, только четные числа)
def filterEvenNumbers = { list ->
    return list.findAll { it % 2 == 0 }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEvenNumbers(numbers)

println "Original list: $numbers"
println "Filtered list (even numbers only): $evenNumbers"

// Замыкание для фильтрации строк по длине
def filterByLength = { minLength, list ->
    return list.findAll { it.length() >= minLength }
}

def words = ["apple", "cat", "elephant", "dog", "hippopotamus"]
def longWords = filterByLength(6, words)

println "Original list: $words"
println "Filtered list (words with length >= 6): $longWords"
