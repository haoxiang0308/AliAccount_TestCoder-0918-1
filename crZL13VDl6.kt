fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter(predicate)
}

// Example usage:
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    val filtered = filterStrings(strings) { it.length > 5 }
    println("Filtered strings: $filtered")
    
    val startsWithA = filterStrings(strings) { it.startsWith("a") }
    println("Strings starting with 'a': $startsWithA")
}
