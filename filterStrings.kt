fun filterStrings(stringList: List<String>, filter: (String) -> Boolean): List<String> {
    return stringList.filter(filter)
}

// Пример использования:
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    val filtered = filterStrings(strings) { it.length > 5 }
    println(filtered) // Выведет: [banana, cherry, elderberry]
}