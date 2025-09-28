// Groovy closure for filtering a list
// This closure returns true for even numbers
def filterEven = { number -> number % 2 == 0 }

// Example list
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Using the closure to filter the list
def evenNumbers = numbers.findAll(filterEven)

// Print the filtered list
println "Original list: $numbers"
println "Filtered list (even numbers): $evenNumbers"
