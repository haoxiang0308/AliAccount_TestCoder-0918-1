extension String {
    /// Reverses the string and returns a new String instance.
    /// Example:
    /// ```
    /// let original = "hello"
    /// let reversed = original.reversedString()
    /// print(reversed) // Prints "olleh"
    /// ```
    func reversedString() -> String {
        return String(self.reversed())
    }
}