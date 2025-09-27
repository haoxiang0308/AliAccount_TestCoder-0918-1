const std = @import("std");
const Point = @import("point_definition.zig").Point;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const random = prng.random();

    // Инициализация точки
    const point = Point{ .x = random.float(f32) * 100, .y = random.float(f32) * 100 };

    // Генерация случайного имени файла
    var random_file_name: [12]u8 = undefined;
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (&random_file_name) |*byte| {
        byte.* = charset[random.uintAtMost(usize, charset.len - 1)];
    }
    const file_name = try std.fmt.allocPrint(std.heap.page_allocator, "data_{s}.bin", .{random_file_name});

    // Сохранение точки в файл
    const file = try std.fs.cwd().createFile(file_name, .{});
    defer file.close();

    try file.writeAll(std.mem.asBytes(&point));
    try stdout.print("Точка {any} сохранена в файл: {s}\n", .{ point, file_name });
}