fun filterStringsByLength(strings: List<String>, minLength: Int): List<String> {
    return strings.filter { it.length >= minLength }
}

// Пример использования
fun main() {
    val stringList = listOf("hello", "world", "Kotlin", "programming", "AI", "filter")
    val filteredList = filterStringsByLength(stringList, 5)
    println(filteredList) // Выведет: [hello, world, Kotlin, programming, filter]
}