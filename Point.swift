import Foundation

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // Optional: initializer with default values
    init() {
        self.x = 0.0
        self.y = 0.0
    }
}

// Example usage:
let point1 = Point(x: 3.5, y: 4.2)
let point2 = Point()

print("Point 1: (\(point1.x), \(point1.y))")
print("Point 2: (\(point2.x), \(point2.y))")