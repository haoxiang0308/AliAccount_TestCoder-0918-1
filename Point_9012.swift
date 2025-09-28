struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

// Пример использования:
let point1 = Point(x: 3.5, y: 7.2)
let point2 = Point(x: -1.0, y: 0.0)

print("Point 1: (\(point1.x), \(point1.y))")
print("Point 2: (\(point2.x), \(point2.y))")