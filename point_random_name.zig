const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() void {
    const my_point = Point{ .x = 3.14, .y = 2.71 };
    // В реальном проекте Zig вы бы использовали std.debug.print для вывода, но для простоты просто объявим переменную.
    _ = my_point;
}