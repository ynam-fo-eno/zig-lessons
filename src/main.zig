const std: type = @import("std");

//Variable names are generally in snake case as you'll observe below.

//This one will be unchanged throughout program's execution...
const global_const: u8 = 18;

//..but this one is variable despite having the same initial value
var global_var: u8 = 18;

//Function names, btw, are camel case.

fn printStuff(name: []const u8, x: anytype) void {
    std.debug.print("{s: >10} {any: ^10}\t{}\n", .{ name, x, @TypeOf(x) });
}

pub fn main() !void {
    //Lines for labelling output apparently
    std.debug.print("{s: >10} {s: ^10}\t{s}\n", .{ "name", "value", "type" });
    std.debug.print("{s: >10} {s: ^10}\t{s}\n", .{ "___", "___", "___" });

    //More of const: immutable values here.
    const a_const = 1;
    //Just as I expected- can't modify const hivi hivi- it's literally in the name!!
    //a_const+=1;
    printStuff("a_const", a_const);

    //More of var: mutable values here.
    comptime var a_var = 1;
    //Unsurprisingly, we can modify this as usual.
    a_var += 1;
    printStuff("a_var", a_var);

    //Note that both need you to initialize the variables,
    //and give them a type or give them one that can be
    //inferred at compile time.

    comptime var b_var = 12;
    b_var *= 2;
    printStuff("b_var", b_var);
    //To try to make b_var as commented immediately below would yield an error:
    // var b_var =12;

    //Leaving variables uninitialized needs to be defined safely by using "undfefined"
    var c_var: u8 = undefined;
    printStuff("c_var(before)", c_var);
    //Prints nonsense value, but...
    c_var = 12;
    printStuff("c_var(after)", c_var);

    //Notice how Zig doesn't permit you to make a variable and then never use it.
    //Indeed this program imekuwa ikiwika until I either increment the variable
    //and/or push it to that printing function we made. The only way to sort of avoid
    //using a variable is assigning your variable to an underscore as shown below.
    const b_const: u8 = 13;
    _ = b_const;

    //Generally variables include:
    // 1. Integers
    //      Unsigned (+): u8 || u16 || u32 || u64 || u128 || usize
    //      Signed (+ && -): i8 || i16 || i32 || i64 || i128 || isize
    // 2. Literals
    //      Can be Decimal ||  Binary || Octal || Hexadecimal
    //You may use underscores for big values for #1 and #2 to make
    //said values more readable.

    //Usize denotes you can use any number of bytes you'd prefer
    //so long as you aren't out of range in the end of assignment.
    //Like below, I can assign 1 or 0 but not 2 onwards.
    var d_var: u1 = 0;
    d_var = 1;
    printStuff("d_var", d_var);

    //Now to floating kiasi, we can use e or E for exponentiation as we shall see

    var e_var: f64 = 2_000_000E-6;
    e_var += 1_000_000;
    printStuff("e_var", e_var);

    var f_var: f64 = 1_000_000e-6;
    f_var += 1_000_000;
    printStuff("f_var", f_var);

    const c_const = 3.1415;
    printStuff("c_const", c_const);
    //There's ways to denote infinity or undefined numbers as shown below
    //_ = std.math.inf(f64);
    // _ = -(std.math.inf(f64));
    // _ = std.math.nan(f64);
}
