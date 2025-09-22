// Замыкание Groovy для фильтрации списка
def filterList = { List list, Closure condition ->
    return list.findAll(condition)
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterList(numbers) { it % 2 == 0 }
println "Четные числа: $evenNumbers"

def words = ["apple", "banana", "cherry", "date", "elderberry"]
def longWords = filterList(words) { it.length() > 5 }
println "Длинные слова: $longWords"