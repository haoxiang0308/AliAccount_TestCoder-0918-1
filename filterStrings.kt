fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 5 }
}

fun main() {
    val strings = listOf("hello", "world", "Kotlin", "is", "awesome", "fun", "language")
    val filtered = filterStrings(strings)
    println("Original list: $strings")
    println("Filtered list (length > 5): $filtered")
}