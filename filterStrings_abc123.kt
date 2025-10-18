/**
 * Функция для фильтрации списка строк
 * @param list Список строк для фильтрации
 * @param predicate Условие фильтрации строк
 * @return Отфильтрованный список строк
 */
fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter { predicate(it) }
}

// Пример использования функции
fun main() {
    val strings = listOf("hello", "world", "kotlin", "programming", "filter")
    
    // Фильтрация строк, которые начинаются с буквы 'k'
    val filtered = filterStrings(strings) { it.startsWith('k') }
    println("Строки, начинающиеся с 'k': $filtered")
    
    // Фильтрация строк с длиной больше 5 символов
    val longStrings = filterStrings(strings) { it.length > 5 }
    println("Строки длиной больше 5: $longStrings")
    
    // Фильтрация строк, содержащих букву 'o'
    val withStringO = filterStrings(strings) { it.contains('o') }
    println("Строки, содержащие 'o': $withStringO")
}