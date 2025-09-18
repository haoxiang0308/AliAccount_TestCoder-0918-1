// Функция для фильтрации списка строк по заданному критерию
fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

// Основная функция для демонстрации работы фильтра
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry", "fig", "grape")
    
    // Пример фильтрации: строки длиной больше 5 символов
    val filteredStrings = filterStrings(strings) { it.length > 5 }
    
    println("Исходный список:")
    strings.forEach { println(it) }
    
    println("\nОтфильтрованный список (длина > 5):")
    filteredStrings.forEach { println(it) }
}