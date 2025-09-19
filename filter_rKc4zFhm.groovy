// Groovy script with a closure for filtering lists
// This closure filters a list to return only even numbers

def filterEvenNumbers = { List<Integer> numbers ->
    return numbers.findAll { it % 2 == 0 }
}

// Example usage
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEvenNumbers(numbers)

println "Original list: ${numbers}"
println "Filtered list (even numbers): ${evenNumbers}"

// Additional closure example - filter strings by length
def filterByLength = { List<String> strings, int length ->
    return strings.findAll { it.length() == length }
}

def words = ["apple", "bat", "car", "door", "elephant"]
def threeLetterWords = filterByLength(words, 3)

println "\nOriginal words: ${words}"
println "Filtered words (3 letters): ${threeLetterWords}"