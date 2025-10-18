const std = @import("std");
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    const point = Point{ .x = 10.5, .y = 20.3 };
    
    // Generate a random filename
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&point)));
    var rand = prng.random();
    
    var filename: [16]u8 = undefined;
    const alphabet = "abcdefghijklmnopqrstuvwxyz0123456789";
    for (&filename) |*byte| {
        byte.* = alphabet[rand.uintAtMost(usize, alphabet.len - 1)];
    }
    
    // Add .dat extension to make it recognizable as a data file
    var full_filename: [20]u8 = undefined;
    @memcpy(full_filename[0..16], &filename);
    @memcpy(full_filename[16..20], ".dat");
    
    const file = try std.fs.cwd().createFile(&full_filename, .{});
    defer file.close();
    
    // Serialize the point to the file
    try file.writeAll(std.mem.asBytes(&point));
    
    std.debug.print("Point {{x: {}, y: {}}} saved to file: {s}\n", .{ point.x, point.y, &full_filename });
}