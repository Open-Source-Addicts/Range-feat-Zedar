const std = @import("std");
const io = std.io.getStdOut().writer();
const ASCII = @embedFile("ASCII");
pub fn big(message: []const u8, l: usize) !void {
    try io.print(" .", .{});
    for (0..l) |_| try io.print("-", .{});
    try io.print(".\n", .{});

    //if (message.len < 20) try rigthline();
    try io.print(" | {s} | \n", .{message});
    //TODO:yeni fonk

    //if (message.len < 20) try rigthline();
    try io.print(" '", .{});
    for (0..l) |_| try io.print("-", .{});
    try io.print("'\n", .{});
    try io.print("{s}", .{ASCII});
}
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const alloc = gpa.allocator();

    const args = try std.process.argsAlloc(alloc);
    defer std.process.argsFree(alloc, args);

    const message = try std.mem.join(alloc, " ", args[1..]);
    //try chat(message, message.len + 4);
    try big(message, message.len + 2);
    //try io.print("{s}\n", .{message});
    //try io.print("{s}\n", .{ASCII});
    //try io.print("{s}", .{args[1..]});
}
