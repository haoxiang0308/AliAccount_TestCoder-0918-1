//
//  StringExtension.swift
//  This file was generated to add a reverse method to the String type.
//

extension String {
    /// Returns a new string with the characters in reverse order.
    ///
    /// Example:
    ///     let original = "hello"
    ///     let reversed = original.reversedString()
    ///     print(reversed) // Prints "olleh"
    ///
    /// - Returns: A new `String` with the characters reversed.
    func reversedString() -> String {
        return String(self.reversed())
    }
}
