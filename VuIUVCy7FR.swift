import Foundation

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    init() {
        self.x = 0.0
        self.y = 0.0
    }
    
    func distance(to other: Point) -> Double {
        let deltaX = self.x - other.x
        let deltaY = self.y - other.y
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
}