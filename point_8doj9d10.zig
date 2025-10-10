const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() void {
    const my_point = Point{ .x = 3.14, .y = 2.71 };
    std.debug.print("Point: {{x={d}, y={d}}}\n", .{ my_point.x, my_point.y });
}
