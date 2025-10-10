fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter(predicate)
}

fun main() {
    val strings = listOf("apple", "banana", "cherry", "date")
    val filtered = filterStrings(strings) { it.length > 5 }
    println(filtered) // Выведет [banana, cherry]
}