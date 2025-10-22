struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // Optional: A method to calculate distance from origin
    func distanceFromOrigin() -> Double {
        return sqrt(x * x + y * y)
    }
    
    // Optional: A method to calculate distance to another point
    func distance(to otherPoint: Point) -> Double {
        let deltaX = self.x - otherPoint.x
        let deltaY = self.y - otherPoint.y
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
}