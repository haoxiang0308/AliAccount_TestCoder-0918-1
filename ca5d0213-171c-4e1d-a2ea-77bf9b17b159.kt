fun filterStrings(stringList: List<String>): List<String> {
    return stringList.filter { it.length > 3 }
}

fun main() {
    val strings = listOf("hi", "hello", "ok", "world", "a", "test")
    val filtered = filterStrings(strings)
    println(filtered)  // Выведет: [hello, world, test]
}