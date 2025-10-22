fun filterStrings(list: List<String>, minLength: Int): List<String> {
    return list.filter { it.length >= minLength }
}

fun main() {
    val strings = listOf("hello", "world", "Kotlin", "programming", "AI")
    val filtered = filterStrings(strings, 5)
    println("Original: $strings")
    println("Filtered (min length 5): $filtered")
}