const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;

// Структура для хранения информации о точке
const Point = struct {
    x: f64,
    y: f64,
    
    // Метод для отображения точки
    pub fn display(self: Point) void {
        print("Point({d}, {d})\n", .{ self.x, self.y });
    }
};

pub fn main() !void {
    // Создаем экземпляр точки
    var point = Point{ .x = 3.14, .y = 2.71 };
    
    // Генерируем случайное имя файла
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&point)));
    var rand = prng.random();
    
    // Создаем буфер для имени файла
    var file_name_buffer: [20]u8 = undefined;
    const alphabet = "abcdefghijklmnopqrstuvwxyz0123456789";
    
    for (0..15) |i| {
        file_name_buffer[i] = alphabet[rand.intRangeAtMost(usize, 0, alphabet.len - 1)];
    }
    @memcpy(file_name_buffer[15..19], ".txt");
    file_name_buffer[19] = 0; // null terminator
    
    const file_name = std.mem.spanZ(&file_name_buffer);
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(file_name, .{});
    defer file.close();
    
    // Записываем информацию о точке в файл
    try file.writer().print("Point coordinates:\nx: {d}\ny: {d}\n", .{ point.x, point.y });
    
    print("Point data saved to file: {s}\n", .{file_name});
    point.display();
}