const std = @import("std");

fn forLoop() void {
    for (0..5) |i| {
        std.debug.print("{}\n", .{i});
    }
}

fn arrayLoop() void {
    const arr = [_]u8{ 10, 20, 30, 40, 50, 60 };

    for (arr) |value| {
        std.debug.print("{}\n", .{value});
    }
}

fn multilineStringLiteral() void {
    const str =
        \\one
        \\two two two
        \\ t H r 3 # \n \n || \\ /askdk/ nvljsda
        \\!@#$%^&*()+_)(*&^%$#@)
        \\five
    ;

    std.debug.print("{s}\n", .{str});
}

pub fn main() void {
    multilineStringLiteral();
}
