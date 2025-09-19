import Foundation

/// A struct representing a point in 2D space
struct Point {
    /// The x coordinate
    var x: Double
    
    /// The y coordinate
    var y: Double
    
    /// Initializes a point with specified coordinates
    /// - Parameters:
    ///   - x: The x coordinate (default: 0.0)
    ///   - y: The y coordinate (default: 0.0)
    init(x: Double = 0.0, y: Double = 0.0) {
        self.x = x
        self.y = y
    }
    
    /// Calculates the distance from this point to another point
    /// - Parameter other: The other point
    /// - Returns: The distance between the two points
    func distance(to other: Point) -> Double {
        let deltaX = x - other.x
        let deltaY = y - other.y
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
}