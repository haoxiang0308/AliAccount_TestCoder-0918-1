struct Point {
    var x: Double
    var y: Double
    
    // Initialize with default values
    init(x: Double = 0.0, y: Double = 0.0) {
        self.x = x
        self.y = y
    }
    
    // Calculate distance from origin
    func distanceFromOrigin() -> Double {
        return sqrt(x * x + y * y)
    }
    
    // Calculate distance to another point
    func distance(to other: Point) -> Double {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy * dy)
    }
}

// Example usage:
let point1 = Point(x: 3.0, y: 4.0)
let point2 = Point(x: 0.0, y: 0.0)

print("Point 1: (\(point1.x), \(point1.y))")
print("Point 2: (\(point2.x), \(point2.y))")
print("Distance from point 1 to origin: \(point1.distanceFromOrigin())")
print("Distance between point 1 and point 2: \(point1.distance(to: point2))")