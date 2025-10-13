/**
 * Функция фильтрует список строк, оставляя только те, длина которых больше 3 символов.
 * @param inputList Входной список строк.
 * @return Отфильтрованный список строк.
 */
fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 3 }
}

// Пример использования
fun main() {
    val strings = listOf("a", "bb", "hello", "world", "!", "Kotlin")
    val filtered = filterStrings(strings)
    println(filtered) // Выведет: [hello, world, Kotlin]
}