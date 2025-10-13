const std = @import("std");

// Определяем структуру Point
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() void {
    // Создаем экземпляр структуры Point
    const my_point = Point{ .x = 3.14, .y = 2.71 };

    // Выводим информацию о точке
    std.debug.print("Point: x={d}, y={d}\n", .{ my_point.x, my_point.y });
}