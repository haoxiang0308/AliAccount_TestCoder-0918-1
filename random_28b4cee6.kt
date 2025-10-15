fun filterStrings(stringList: List<String>, minLength: Int = 3): List<String> {
    return stringList.filter { it.length > minLength }
}

fun main() {
    val strings = listOf("hello", "hi", "kotlin", "code", "fun")
    val filtered = filterStrings(strings)
    println("Original: $strings")
    println("Filtered (length > 3): $filtered")
}