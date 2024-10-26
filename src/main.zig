const std: type = @import("std");

pub fn main() !void {
    const zero: u8 = 0;
    const one: u8 = 1;
    const two: u8 = 2;
    const two_fifty: u8 = 250;

    //below is fine, should turn to 252...
    var result = (one * zero) + (two + two_fifty);
    std.debug.print("Result = {}\n", .{result});
    //...but this isn't and yields buffer overflow- unless you use % for wrapping!
    result = (two *% two_fifty);
    std.debug.print("*% Result = {}\n", .{result});
    //Use single | for saturation
    result = (two *| two_fifty);
    std.debug.print("*| Result = {}\n", .{result});
    //This yields something smaller than zero (another potential case of overflow)
    //hence our use of wrapping to get this to 255 also
    result = zero -% one;
    std.debug.print("-% Result = {}\n", .{result});
    //Same idea except sasa we use | to saturate and limit it to zero.
    result = zero -| one;
    std.debug.print("-| Result = {}\n", .{result});

    //Shifting ops
    _ = 1 << 2;
    _ = 1 <<| 2;
    _ = 32 >> 1;

    //Bitwise logical ops
    _ = 32 | 2; //or
    _ = 32 & 1; //and
    _ = 32 ^ 0; //xor
    const one_bit: u8 = 0b0000_0001;
    _ = ~one_bit; //not

    //Comparison ops
    _ = 3 < 9;
    _ = 3 <= 9;
    _ = 3 > 9;
    _ = 3 >= 9;
    _ = 3 == 9;
    _ = 3 != 9;

    //How to do type coerciion safely in Zig (more on this later)...
    const uno: u8 = 200;
    const dos: u16 = 999;
    const tres: u32 = (uno + dos);
    std.debug.print("Tres: {}\n", .{tres});
    const quatro: u16 = @intCast(tres);
    std.debug.print("Quatro : {}\n", .{quatro});

    const a_float: f32 = 3.14195;
    const an_int: i32 = @intFromFloat(a_float);
    std.debug.print("Pi (as usual) : {}\n", .{a_float});
    std.debug.print("Pi (as an int) : {}\n", .{an_int});

    //Note Zig has std.math for other ops.
    //For your personal further exploration.
    //Other useful ops include : @addWithOverflow, @mod, @rem, @sqrt, @max, @min,...
}
