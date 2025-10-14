//
//  StringExtension_9j2k4.swift
//  This file contains a Swift extension on String to add a method for reversing the string.
//

extension String {
    /// Returns a new string with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// let originalString = "hello, world!"
// let reversedString = originalString.reversed()
// print(reversedString) // Output: !dlrow ,olleh