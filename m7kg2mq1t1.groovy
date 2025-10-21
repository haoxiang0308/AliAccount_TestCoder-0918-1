// Groovy closure for filtering a list
def filterClosure = { list, condition ->
    return list.findAll(condition)
}

// Example usage:
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterClosure(numbers) { it % 2 == 0 }
println "Even numbers: ${evenNumbers}"

def greaterThanFive = filterClosure(numbers) { it > 5 }
println "Numbers greater than 5: ${greaterThanFive}"

def strings = ["apple", "banana", "cherry", "date"]
def longWords = filterClosure(strings) { it.length() > 5 }
println "Long words: ${longWords}"
