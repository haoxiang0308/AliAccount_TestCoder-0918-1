// Замыкание для фильтрации списка
def filterClosure = { list ->
    return list.findAll { it % 2 == 0 } // Фильтрует четные числа
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def filteredNumbers = filterClosure(numbers)
println "Оригинальный список: ${numbers}"
println "Отфильтрованный список (четные числа): ${filteredNumbers}"

// Возврат замыкания
return filterClosure