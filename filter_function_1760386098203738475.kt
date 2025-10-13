/**
 * Фильтрует список строк, возвращая только те, длина которых больше 3 символов.
 * @param inputList Список строк для фильтрации.
 * @return Отфильтрованный список строк.
 */
fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 3 }
}

// Пример использования
fun main() {
    val strings = listOf("a", "hello", "hi", "world", "Kotlin", "ok")
    val filtered = filterStrings(strings)
    println(filtered) // Выведет: [hello, world, Kotlin]
}