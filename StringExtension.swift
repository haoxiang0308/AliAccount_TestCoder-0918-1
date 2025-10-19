extension String {
    /// Reverses the string and returns a new reversed string
    func reversed() -> String {
        return String(self.reversed())
    }
    
    /// Reverses the string in place
    mutating func reverse() {
        self = String(self.reversed())
    }
}

// Example usage:
/*
let originalString = "Hello, World!"
let reversedString = originalString.reversed()
print(reversedString) // Output: !dlroW ,olleH

var mutableString = "Swift"
mutableString.reverse()
print(mutableString) // Output: tfiwS
*/