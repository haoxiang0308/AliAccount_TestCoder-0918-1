// Swift extension to add a reverse method to String
extension String {
    /// Returns a new string with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
let originalString = "hello"
let reversedString = originalString.reversed()
print("Original: $originalString)")
print("Reversed: $reversedString)")