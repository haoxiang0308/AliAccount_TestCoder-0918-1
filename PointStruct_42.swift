import Foundation

/// Структура, представляющая точку в двумерном пространстве.
struct Point {
    /// Координата X точки.
    var x: Double
    /// Координата Y точки.
    var y: Double
}

// Пример использования:
let pointA = Point(x: 3.5, y: 7.2)
print("Точка A находится по координатам (\(pointA.x), \(pointA.y))")