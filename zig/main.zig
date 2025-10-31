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

fn binary() void {
    const bin = 0b1;
    print("{d}\n", .{bin << 11});
}

fn pointerMagic() void {
    var runtime1: i32 = 42;
    var runtime2: i32 = 42;
    var runtime3: i32 = 42;
    var runtime4: i32 = 42;

    const runtimePointer1 = &runtime1;
    const runtimePointer2 = &runtime2;
    const runtimePointer3 = &runtime3;
    const runtimePointer4 = &runtime4;

    print("runtimePointer1: {p}\n", .{runtimePointer1});
    print("runtimePointer2: {p}\n", .{runtimePointer2});
    print("runtimePointer3: {p}\n", .{runtimePointer3});
    print("runtimePointer4: {p}\n", .{runtimePointer4});

    print("\n", .{});

    const constant1: i32 = 42;
    const constant2: i32 = 42;
    const constant3: i32 = 42;
    const constant4: i32 = 42;

    const constantPointer1 = &constant1;
    const constantPointer2 = &constant2;
    const constantPointer3 = &constant3;
    const constantPointer4 = &constant4;

    print("constantPointer1: {p}\n", .{constantPointer1});
    print("constantPointer2: {p}\n", .{constantPointer2});
    print("constantPointer3: {p}\n", .{constantPointer3});
    print("constantPointer4: {p}\n", .{constantPointer4});
}

fn arrays() void {
    const eightColors = [8][3]u8{
        [3]u8{ 100, 100, 100 },
        [3]u8{ 100, 100, 100 },
        [3]u8{ 100, 100, 100 },
        [3]u8{ 100, 100, 100 },
        [3]u8{ 100, 100, 100 },
        [3]u8{ 100, 100, 100 },
        [3]u8{ 100, 100, 100 },
        [3]u8{ 100, 100, 100 },
    };

    print("Fourth Color: {s}\n", .{eightColors[3]});
    print("Sixth Red Value: {d}\n", .{eightColors[5][0]});
}

fn arrayCopy() void {
    var arrA = [5]u8{ 100, 100, 100, 100, 100 };

    var arrB = arrA;

    arrA[0] += 5;
    arrB[2] += 1;
    arrB[3] += 1;
    arrB[4] += 1;

    print("arrA: {s}\n", .{arrA});
    print("arrB: {s}\n", .{arrB});

    // Output:
    // arrA: idddd
    // arrB: ddeee
}

fn arrayLength() void {
    const arr = [5]u8{ 10, 20, 30, 40, 50 };
    const length = arr.len;

    print("{d}\n", .{length});
    // Output:
    // 5
}

fn arrayDestructure() void {
    const color = [3]u8{ 101, 102, 103 };

    const R, const G, const B = color;

    print("RGB({d}, {d}, {d})\n", .{ R, G, B });

    const eightColors = [8][3]u8{
        [3]u8{ 100, 101, 110 },
        [3]u8{ 100, 102, 120 },
        [3]u8{ 100, 103, 130 },
        [3]u8{ 100, 104, 140 },
        [3]u8{ 100, 105, 150 },
        [3]u8{ 100, 106, 160 },
        [3]u8{ 100, 107, 170 },
        [3]u8{ 100, 108, 180 },
    };

    const thirdRed, const thirdGreen, const thirdBlue = eightColors[2];

    print("RGB({d}, {d}, {d})\n", .{ thirdRed, thirdGreen, thirdBlue });

    // Output:
    // RGB(101, 102, 103)
    // RGB(100, 103, 130)
}

fn vectors() void {
    const a = @Vector(3, u8){ 10, 20, 30 };
    const b = @Vector(3, u8){ 50, 50, 50 };

    const c = a + b;

    print("a: {}\n", .{a});
    print("b: {}\n", .{b});
    print("c: {}\n", .{c});
}

fn splat() void {
    const vec: @Vector(4, i32) = @splat(42);
    print("vec: {}\n", .{vec});

    const arr: [4]i32 = @splat(42);
    print("arr: {any}\n", .{arr});
}

pub fn main() void {
    for (0..2) |_| {
        print("\n", .{});
    }

    splat();

    for (0..2) |_| {
        print("\n", .{});
    }
}
