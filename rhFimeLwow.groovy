// Groovy script demonstrating a closure for filtering a list
// File name: rhFimeLwow.groovy

// Define a list of numbers
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Create a closure to filter even numbers
def isEven = { it % 2 == 0 }

// Use the closure to filter the list
def evenNumbers = numbers.findAll(isEven)

// Print the results
println "Original list: $numbers"
println "Even numbers: $evenNumbers"

// Another example with strings
def words = ["apple", "banana", "cherry", "date", "elderberry"]

// Closure to filter words with more than 5 characters
def isLongWord = { it.length() > 5 }

// Filter the words
def longWords = words.findAll(isLongWord)

// Print the string filtering results
println "Original words: $words"
println "Long words: $longWords"

// Example of an inline closure
def filtered = numbers.findAll { it > 5 }
println "Numbers greater than 5: $filtered"