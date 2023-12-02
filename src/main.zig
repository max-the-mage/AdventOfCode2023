const std = @import("std");
const coords = @embedFile("input.txt");

pub fn main() !void {
    const nums = [_][]const u8{ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };
    _ = nums;

    var line_slices = std.mem.splitSequence(u8, coords, "\n");
    var sum: u32 = 0;
    while (line_slices.next()) |line| {
        var values = [_]u8{ 0, 0 };

        for (line) |char| {
            if (char > '0' and char <= '9') {
                if (values[0] == 0) {
                    values[0] = char;
                }

                values[1] = char;
            } else {}
        }
        sum += try std.fmt.parseInt(u32, &values, 10);
    }
    std.debug.print("{d}\n", .{sum});
}
