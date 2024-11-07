const std: type = @import("std");

pub fn main() !void {
    //Standard way to make an array
    const array_1: [5]u8 = [5]u8{ 1, 2, 3, 4, 5 };
    std.debug.print("a1: {any}, array_1.length = {}\n", .{ array_1, array_1.len });

    //arrays can be repeated
    const rep_array_1 = array_1 ** 2;
    std.debug.print("a1: {any}, array_1.length = {}\n", .{ rep_array_1, rep_array_1.len });

    //Multi-dimensional arrays look sth like this
    const two_d_array: [2][2]u16 = [2][2]u16{
        .{ 1, 2 },
        .{ 3, 4 },
    };
    std.debug.print("a1: {any}, array_1.length = {}\n", .{ two_d_array, two_d_array.len });

    //Sentinel-terminated arrays...
    const senthi_array: [4:0]u8 = [4:0]u8{ 1, 2, 3, 4 };
    std.debug.print("a1: {any}, array_1.length = {}\nSentinel = {}\n", .{ senthi_array, senthi_array.len, senthi_array[senthi_array.len] });

    //
    //
    //
    //

}
