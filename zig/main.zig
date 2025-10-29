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

    print("{}\n", .{@TypeOf(bytes)});
    print("{c}\n", .{bytes[1]});
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

fn destructure() void {
    var x: i32 = undefined;
    var y: i32 = undefined;
    var z: i32 = undefined;

    const tuple = .{ 10, 20, 30 };

    x, y, z = tuple;

    print("{d}\n", .{x}); // 10
    print("{d}\n", .{y}); // 20
    print("{d}\n", .{z}); // 30

    const array = [_]i32{ 100, 200, 300 };

    x, y, z = array;

    print("{d}\n", .{x}); // 100
    print("{d}\n", .{y}); // 200
    print("{d}\n", .{z}); // 300

    const vector: @Vector(3, i32) = .{ 1000, 2000, 3000 };

    x, y, z = vector;

    print("{d}\n", .{x}); // 1000
    print("{d}\n", .{y}); // 2000
    print("{d}\n", .{z}); // 3000

    const vx, _, const vz: i32 = vector;

    print("{d}\n", .{vx}); // 1000
    print("{d}\n", .{vz}); // 3000
}

fn wrappingOperators() void {
    const a: u8 = 1;
    print("Wrapping subtraction: {d}\n", .{a -% 5});

    const b: u8 = 254;
    print("Wrapping addition: {d}\n", .{b +% 5});
}

pub fn main() void {
    wrappingOperators();
}
