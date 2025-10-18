fun filterStringsStartingWithA(stringList: List<String>): List<String> {
    return stringList.filter { it.toLowerCase().startsWith('a') }
}

fun main() {
    val testList = listOf("apple", "banana", "apricot", "cherry", "Avocado", "grape")
    val filteredList = filterStringsStartingWithA(testList)
    println(filteredList)
}