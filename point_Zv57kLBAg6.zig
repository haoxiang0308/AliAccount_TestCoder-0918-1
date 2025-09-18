// Point structure in Zig
const std = @import("std");

pub const Point = struct {
    x: f32,
    y: f32,
    
    // Function to create a new point
    pub fn init(x: f32, y: f32) Point {
        return Point{ .x = x, .y = y };
    }
    
    // Function to calculate distance from origin
    pub fn distanceFromOrigin(self: Point) f32 {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }
    
    // Function to add two points
    pub fn add(self: Point, other: Point) Point {
        return Point{ .x = self.x + other.x, .y = self.y + other.y };
    }
};

// Example usage
pub fn main() void {
    var point1 = Point.init(3.0, 4.0);
    var point2 = Point.init(1.0, 2.0);
    
    std.debug.print("Point 1: ({}, {})\n", .{ point1.x, point1.y });
    std.debug.print("Point 2: ({}, {})\n", .{ point2.x, point2.y });
    std.debug.print("Distance of Point 1 from origin: {}\n", .{point1.distanceFromOrigin()});
    var point3 = point1.add(point2);
    std.debug.print("Point 1 + Point 2: ({}, {})\n", .{ point3.x, point3.y });
}