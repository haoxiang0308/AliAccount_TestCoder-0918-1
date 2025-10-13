const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;

// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
    z: f32,

    // Функция для форматированного вывода точки
    pub fn toString(self: Point, allocator: std.mem.Allocator) ![]u8 {
        return std.fmt.allocPrint(allocator, "Point({d}, {d}, {d})", .{ self.x, self.y, self.z });
    }
};

pub fn main() !void {
    // Инициализация точки
    const my_point = Point{ .x = 1.5, .y = 2.7, .z = -0.3 };

    // Получение глобального аллокатора
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Генерация случайного имени файла (упрощённо, используя фиксированное имя с суффиксом)
    // В реальном сценарии Zig может использовать std.os.time для генерации уникальных имён.
    const file_name = try std.fmt.allocPrint(allocator, "point_output_{}.txt", .{12345}); // Используем фиксированное число вместо случайного
    defer allocator.free(file_name);

    print("Создание точки: {any}\n", .{my_point});
    print("Запись в файл: {s}\n", .{file_name});

    // Открытие файла для записи
    var file = try std.fs.cwd().createFile(file_name, .{});

    // Преобразование точки в строку
    const point_str = try my_point.toString(allocator);

    // Запись строки в файл
    try file.writeAll(point_str);

    // Закрытие файла
    file.close();

    print("Точка записана в файл.\n", .{});
}