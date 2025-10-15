fun filterStrings(inputList: List<String>, minLength: Int = 3): List<String> {
    return inputList.filter { it.length > minLength }
}

// Пример использования
fun main() {
    val strings = listOf("hello", "hi", "kotlin", "a", "world")
    val filtered = filterStrings(strings)
    println(filtered) // Выведет: [hello, kotlin, world]
}