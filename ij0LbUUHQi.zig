const std = @import("std");

pub const Point = struct {
    x: f32,
    y: f32,

    // Function to initialize a new point
    pub fn init(x: f32, y: f32) Point {
        return Point{ .x = x, .y = y };
    }

    // Function to calculate the distance from the origin
    pub fn distanceFromOrigin(self: Point) f32 {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }
};