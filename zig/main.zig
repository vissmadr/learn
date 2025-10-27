const std = @import("std");
const mem = @import("std").mem; // will be used to compare bytes
const print = std.debug.print;

fn forLoop() void {
    for (0..5) |i| {
        print("{}\n", .{i});
    }
}

fn arrayLoop() void {
    const arr = [_]u8{ 10, 20, 30, 40, 50, 60 };

    for (arr) |value| {
        print("{}\n", .{value});
    }
}

fn stringLiteral() void {
    const bytes = "hello";

    const asd = &bytes;
    print("{}\n", .{asd});
}

fn multilineStringLiteral() void {
    const gibberish =
        \\one
        \\two two two
        \\ t H r 3 # \n \n || \\ /askdk/ nvljsda
        \\!@#$%^&*()+_)(*&^%$#@)
        \\five
    ;

    print("{s}\n", .{gibberish});

    const helloWorldInC =
        \\#include <stdio.h>
        \\
        \\int main(int argc, char **argv) {
        \\    printf("hello world\n");
        \\    return 0;
        \\}
    ;

    print("{s}\n", .{helloWorldInC});
}

pub fn main() void {
    const solid: i32 = 42;
    print("{}\n", .{solid});

    var fluid: i32 = 1234;
    fluid = 5678;
    print("{}\n", .{fluid});
}
