extension String {
    /// Reverses the string in place by mutating the character array.
    mutating func reverse() {
        self = String(self.reversed())
    }

    /// Returns a new string that is the reverse of the original string.
    /// - Returns: A new reversed string.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
var myString = "Hello, world!"
print("Original: \(myString)")
myString.reverse()
print("Reversed (mutating): \(myString)")

let anotherString = "Swift"
let reversedString = anotherString.reversed()
print("Original: \(anotherString)")
print("Reversed (non-mutating): \(reversedString)")