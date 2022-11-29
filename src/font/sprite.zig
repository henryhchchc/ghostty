const std = @import("std");
pub const Canvas = @import("sprite/Canvas.zig");
pub const Face = @import("sprite/Face.zig");

/// Sprites are represented as special codepoints outside of the Unicode
/// codepoint range. Unicode maxes out at U+10FFFF (21 bits), and we use the
/// high 11 bits to hide our special characters.
///
/// These characters are ONLY used for rendering and NEVER used written to
/// text files or any other exported format, so we don't use the Private Use
/// Area of Unicode.
pub const Sprite = enum(u32) {
    // Start 1 above the maximum Unicode codepoint.
    pub const start: u32 = std.math.maxInt(u21) + 1;
    pub const end: u32 = std.math.maxInt(u32);

    underline = start,
    underline_double = start + 1,
    underline_dotted = start + 2,
    underline_dashed = start + 3,
    underline_curly = start + 4,

    // Note: we don't currently put the box drawing glyphs in here because
    // there are a LOT and I'm lazy. What I want to do is spend more time
    // studying the patterns to see if we can programmatically build our
    // enum perhaps and comptime generate the drawing code at the same time.
    // I'm not sure if that's advisable yet though.
};

test {
    @import("std").testing.refAllDecls(@This());
}