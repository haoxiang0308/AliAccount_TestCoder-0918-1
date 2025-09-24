// Swift Extension for String to add a reverse method

extension String {
    /// Returns a new string with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// let originalString = "hello"
// let reversedString = originalString.reversed()
// print(reversedString) // Output: "olleh"
