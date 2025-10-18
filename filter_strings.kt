fun filterStrings(stringList: List<String>, minLength: Int = 3): List<String> {
    return stringList.filter { it.length > minLength }
}

fun main() {
    val strings = listOf("hello", "hi", "kotlin", "is", "awesome")
    val filtered = filterStrings(strings)
    println("Original: $strings")
    println("Filtered: $filtered")
}