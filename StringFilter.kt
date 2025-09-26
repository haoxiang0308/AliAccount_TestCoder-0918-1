fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 3 }
}

fun main() {
    val strings = listOf("a", "hello", "hi", "world", "Kotlin", "is", "cool")
    val filteredStrings = filterStrings(strings)
    println(filteredStrings) // Выведет: [hello, world, Kotlin, cool]
}