const std = @import("std");
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    
    // Создаем экземпляр структуры точки
    const point = Point{ .x = 3.5, .y = 7.2 };
    
    // Генерируем случайное имя файла
    var seed: u64 = @intCast(std.time.milliTimestamp());
    var prng = std.Random.DefaultPrng.init(seed);
    const random = prng.random();
    
    var file_name: [16]u8 = undefined;
    const alphabet = "abcdefghijklmnopqrstuvwxyz0123456789";
    for (&file_name) |*byte| {
        byte.* = alphabet[random.uintAtMost(usize, alphabet.len - 1)];
    }
    
    // Добавляем расширение .txt
    var full_name: [20]u8 = undefined;
    @memcpy(full_name[0..16], &file_name);
    @memcpy(full_name[16..20], ".txt\x00");
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(&full_name, .{});
    defer file.close();
    
    // Записываем информацию о точке в файл
    try file.writer().print("Point coordinates: x = {}, y = {}\n", .{ point.x, point.y });
    
    try stdout.print("Point structure saved to file: {s}\n", .{full_name[0..16]});
}