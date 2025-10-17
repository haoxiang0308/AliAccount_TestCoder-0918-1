#!/usr/bin/env groovy

// Замыкание для фильтрации списка
def filterClosure = { list ->
    // Пример: фильтрация только четных чисел
    return list.findAll { it % 2 == 0 }
}

// Альтернативный пример: фильтрация строк, начинающихся с 'A'
def filterStringsClosure = { list ->
    return list.findAll { it.startsWith('A') }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def strings = ['Apple', 'Banana', 'Avocado', 'Cherry', 'Apricot']

println "Оригинальный список чисел: ${numbers}"
println "Отфильтрованные четные числа: ${filterClosure(numbers)}"

println "Оригинальный список строк: ${strings}"
println "Строки, начинающиеся с 'A': ${filterStringsClosure(strings)}"