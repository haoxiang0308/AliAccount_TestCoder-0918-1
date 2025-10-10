fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 3 }
}

fun main() {
    val strings = listOf("hi", "hello", "cat", "world", "a", "Kotlin")
    println("Original list: $strings")
    println("Filtered list: ${filterStrings(strings)}")
}