const std = @import("std");
const zine = @import("zine");

pub fn build(b: *std.Build) !void {
    const katex = b.dependency("katex", .{});

    const fonts = fonts: {
        var entries: [katex_fonts_list.len]zine.BuildAsset = undefined;
        for (katex_fonts_list, 0..) |filename, i| {
            const path = try std.mem.concat(b.allocator, u8, &.{ "fonts/", filename });
            entries[i] = .{
                .name = filename,
                .lp = katex.path(path),
                .install_path = path,
                .install_always = true,
            };
        }
        break :fonts &entries;
    };
    const assets = try std.mem.concat(b.allocator, zine.BuildAsset, &.{ fonts, &.{
        .{ .name = "zon", .lp = b.path("build.zig.zon") },
        .{ .name = "frontmatter", .lp = b.dependency("zine", .{}).path("frontmatter.ziggy-schema") },
        .{
            .name = "katex-css",
            .lp = katex.path("katex.min.css"),
            .install_path = "katex.min.css",
        },
        .{
            .name = "katex-js",
            .lp = katex.path("katex.min.js"),
            .install_path = "katex.min.js",
        },
        .{
            .name = "katex-auto",
            .lp = katex.path("contrib/auto-render.min.js"),
            .install_path = "auto-render.min.js",
        },
    } });

    zine.website(b, .{
        .title = "Alanza – Robbie Lyman",
        .host_url = "https://alanza.xyz",
        .layouts_dir_path = "layouts",
        .content_dir_path = "content",
        .assets_dir_path = "assets",
        .static_assets = &.{
            "CNAME",

            "fonts/IosevkaTermSlab-ExtendedLight.ttf",

            "fonts/Sarabun-Regular.ttf",
            "fonts/Sarabun-Bold.ttf",
            "fonts/Sarabun-BoldItalic.ttf",
            "fonts/Sarabun-Italic.ttf",
            "fonts/Sarabun-Light.ttf",
            "fonts/Sarabun-LightItalic.ttf",

            "fonts/crimson-roman-webfont.eot",
            "fonts/crimson-roman-webfont.woff",
            "fonts/crimson-roman-webfont.ttf",

            "fonts/crimson-italic-webfont.eot",
            "fonts/crimson-italic-webfont.woff",
            "fonts/crimson-italic-webfont.ttf",

            "fonts/crimson-semibolditalic-webfont.eot",
            "fonts/crimson-semibolditalic-webfont.woff",
            "fonts/crimson-semibolditalic-webfont.ttf",

            "fonts/crimson-bold-webfont.eot",
            "fonts/crimson-bold-webfont.woff",
            "fonts/crimson-bold-webfont.ttf",

            "fonts/crimson-bolditalic-webfont.eot",
            "fonts/crimson-bolditalic-webfont.woff",
            "fonts/crimson-bolditalic-webfont.ttf",
        },
        .build_assets = assets,
        .debug = true,
    });
}

const katex_fonts_list: []const []const u8 = &.{
    "KaTeX_Fraktur-Regular.woff2",
    "KaTeX_AMS-Regular.woff",
    "KaTeX_Size1-Regular.woff",
    "KaTeX_Size2-Regular.ttf",
    "KaTeX_Main-Regular.woff",
    "KaTeX_Main-BoldItalic.woff",
    "KaTeX_AMS-Regular.woff2",
    "KaTeX_Size4-Regular.woff2",
    "KaTeX_Main-Italic.woff",
    "KaTeX_Fraktur-Bold.ttf",
    "KaTeX_Size4-Regular.ttf",
    "KaTeX_Caligraphic-Bold.woff2",
    "KaTeX_Size1-Regular.woff2",
    "KaTeX_Caligraphic-Regular.ttf",
    "KaTeX_SansSerif-Bold.ttf",
    "KaTeX_Typewriter-Regular.ttf",
    "KaTeX_Caligraphic-Bold.ttf",
    "KaTeX_Main-Bold.woff2",
    "KaTeX_SansSerif-Italic.ttf",
    "KaTeX_Size1-Regular.ttf",
    "KaTeX_Fraktur-Bold.woff",
    "KaTeX_Math-BoldItalic.woff",
    "KaTeX_Main-Regular.ttf",
    "KaTeX_Math-BoldItalic.ttf",
    "KaTeX_Fraktur-Regular.woff",
    "KaTeX_SansSerif-Italic.woff",
    "KaTeX_AMS-Regular.ttf",
    "KaTeX_SansSerif-Regular.woff2",
    "KaTeX_SansSerif-Bold.woff",
    "KaTeX_SansSerif-Regular.woff",
    "KaTeX_SansSerif-Bold.woff2",
    "KaTeX_Main-BoldItalic.ttf",
    "KaTeX_Main-Regular.woff2",
    "KaTeX_Main-Italic.ttf",
    "KaTeX_Main-Bold.woff",
    "KaTeX_Size2-Regular.woff2",
    "KaTeX_Math-Italic.ttf",
    "KaTeX_Caligraphic-Regular.woff2",
    "KaTeX_Math-Italic.woff2",
    "KaTeX_Script-Regular.ttf",
    "KaTeX_SansSerif-Italic.woff2",
    "KaTeX_Caligraphic-Regular.woff",
    "KaTeX_Typewriter-Regular.woff2",
    "KaTeX_Size3-Regular.ttf",
    "KaTeX_Main-Italic.woff2",
    "KaTeX_Size3-Regular.woff2",
    "KaTeX_Caligraphic-Bold.woff",
    "KaTeX_Math-BoldItalic.woff2",
    "KaTeX_Script-Regular.woff",
    "KaTeX_Fraktur-Regular.ttf",
    "KaTeX_Main-Bold.ttf",
    "KaTeX_Size4-Regular.woff",
    "KaTeX_Size3-Regular.woff",
    "KaTeX_Fraktur-Bold.woff2",
    "KaTeX_Typewriter-Regular.woff",
    "KaTeX_SansSerif-Regular.ttf",
    "KaTeX_Math-Italic.woff",
    "KaTeX_Size2-Regular.woff",
    "KaTeX_Script-Regular.woff2",
    "KaTeX_Main-BoldItalic.woff2",
};
