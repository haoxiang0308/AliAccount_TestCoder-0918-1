// Groovy closure for filtering a list
def filterClosure = { list, condition ->
    return list.findAll(condition)
}

// Example usage:
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterClosure(numbers) { it % 2 == 0 }
println "Original list: ${numbers}"
println "Filtered (even numbers): ${evenNumbers}"

def strings = ["apple", "banana", "cherry", "date", "elderberry"]
def longStrings = filterClosure(strings) { it.length() > 5 }
println "Original strings: ${strings}"
println "Filtered (longer than 5 chars): ${longStrings}"

// Return the closure
return filterClosure