// filter_closure_abc123.groovy
// Замыкание для фильтрации списка
def filter = { list, condition ->
    return list.findAll(condition)
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filter(numbers) { it % 2 == 0 }
def greaterThanFive = filter(numbers) { it > 5 }

println "Исходный список: $numbers"
println "Четные числа: $evenNumbers"
println "Больше 5: $greaterThanFive"
