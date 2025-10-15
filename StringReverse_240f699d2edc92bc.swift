// Swift extension to add a reverse method to String
extension String {
    /// Returns a new string with the characters in reverse order
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// let originalString = "Hello, World!"
// let reversedString = originalString.reversed()
// print(reversedString) // Output: "!dlroW ,olleH"