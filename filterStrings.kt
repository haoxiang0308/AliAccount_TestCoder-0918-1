fun filterStringsByLength(strings: List<String>, minLength: Int): List<String> {
    return strings.filter { it.length >= minLength }
}

// Пример использования
fun main() {
    val inputStrings = listOf("hello", "hi", "kotlin", "programming", "fun")
    val filteredStrings = filterStringsByLength(inputStrings, 4)
    println("Строки с длиной >= 4: $filteredStrings")
}