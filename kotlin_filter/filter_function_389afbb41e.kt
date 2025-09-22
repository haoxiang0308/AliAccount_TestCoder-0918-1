fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

// Пример использования
fun main() {
    val words = listOf("apple", "banana", "avocado", "cherry", "apricot")
    
    // Фильтруем строки, которые начинаются на "a"
    val filteredWords = filterStrings(words) { it.startsWith("a") }
    
    println("Исходный список: $words")
    println("Отфильтрованный список: $filteredWords")
}