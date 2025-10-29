const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;

// Определяем структуру точки
const Point = struct {
    x: f32,
    y: f32,
    
    // Метод для отображения точки
    pub fn display(self: Point) void {
        print("Point({d}, {d})\n", .{ self.x, self.y });
    }
};

pub fn main() !void {
    // Создаем экземпляр точки
    var point = Point{ .x = 3.5, .y = 7.2 };
    
    // Генерируем случайное имя файла
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&point)));
    var rand = prng.random();
    
    // Создаем случайное имя файла
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    var filename = try std.ArrayList(u8).initCapacity(allocator, 20);
    defer filename.deinit();
    
    // Добавляем префикс
    try filename.appendSlice("point_data_");
    
    // Генерируем случайные цифры для имени файла
    for (0..10) |_| {
        const digit = rand.intRangeAtMost(u8, 48, 57); // ASCII 48-57 это '0'-'9'
        try filename.append(digit);
    }
    
    try filename.appendSlice(".dat");
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(filename.items, .{});
    defer file.close();
    
    // Записываем данные точки в файл
    try file.writeAll(std.mem.asBytes(&point));
    
    print("Point data saved to file: {s}\n", .{filename.items});
    point.display();
}