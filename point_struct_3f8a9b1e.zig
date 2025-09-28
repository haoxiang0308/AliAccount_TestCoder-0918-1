// Структура Point для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
};

// Пример использования структуры Point
pub fn main() void {
    const p = Point{ .x = 3.14, .y = 2.71 };
    std.debug.print("Point coordinates: x = {}, y = {}\n", .{ p.x, p.y });
}

const std = @import("std");