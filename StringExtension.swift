extension String {
    /// Reverses the string and returns a new string
    func reversed() -> String {
        return String(self.reversed())
    }
    
    /// Reverses the string in place
    mutating func reverse() {
        self = String(self.reversed())
    }
}