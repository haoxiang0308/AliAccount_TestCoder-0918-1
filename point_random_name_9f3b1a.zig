const std = @import("std");

pub const Point = struct {
    x: f32,
    y: f32,

    pub fn init(x: f32, y: f32) Point {
        return Point{ .x = x, .y = y };
    }

    pub fn distanceFromOrigin(self: Point) f32 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const p = Point.init(3.0, 4.0);
    try stdout.print("Point: ({d}, {d})\n", .{ p.x, p.y });
    try stdout.print("Distance from origin: {d}\n", .{p.distanceFromOrigin()});
}