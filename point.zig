const std = @import("std");
const print = std.debug.print;

// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
    
    // Метод для вывода информации о точке
    pub fn display(self: Point) void {
        print("Point({d}, {d})\n", .{ self.x, self.y });
    }
};

pub fn main() !void {
    // Создаем экземпляр структуры точки
    const point = Point{ .x = 3.5, .y = 7.2 };
    
    // Выводим информацию о точке
    point.display();
    
    // Генерируем случайное имя файла
    var buf: [16]u8 = undefined;
    _ = std.crypto.random.bytes(buf[0..8]);
    var file_name: [32]u8 = undefined;
    const len = try std.fmt.bufPrint(&file_name, "point_{x:0>8}.zig", .{ buf[0] });
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(file_name[0..len], .{});
    defer file.close();
    
    // Записываем информацию о точке в файл
    try file.writeAll("Point coordinates: x = ");
    try file.writer().print("{d}, y = {d}\n", .{ point.x, point.y });
    
    print("Point data saved to file: {s}\n", .{file_name[0..len]});
}