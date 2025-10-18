fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 3 }
}

fun main() {
    val strings = listOf("hi", "hello", "kotlin", "code", "a", "function")
    val filtered = filterStrings(strings)
    println("Filtered strings: $filtered")
}