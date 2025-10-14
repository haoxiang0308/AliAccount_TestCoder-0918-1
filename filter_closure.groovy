// Замыкание для фильтрации списка
def filterClosure = { list, condition ->
    return list.findAll(condition)
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterClosure(numbers) { it % 2 == 0 }
println "Original list: $numbers"
println "Even numbers: $evenNumbers"

def words = ["apple", "banana", "cherry", "date", "elderberry"]
def longWords = filterClosure(words) { it.length() > 5 }
println "Original words: $words"
println "Long words: $longWords"
