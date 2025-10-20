fun filterStrings(stringList: List<String>, filterCondition: (String) -> Boolean): List<String> {
    return stringList.filter(filterCondition)
}

// Пример использования
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    val filtered = filterStrings(strings) { it.length > 5 }
    println(filtered) // Выведет: [banana, cherry, elderberry]
}