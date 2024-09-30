const std = @import("std");
const zine = @import("zine");

pub fn build(b: *std.Build) !void {
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
        .build_assets = &.{
            .{
                .name = "zon",
                .lp = b.path("build.zig.zon"),
            },
            .{
                .name = "frontmatter",
                .lp = b.dependency("zine", .{}).path("frontmatter.ziggy-schema"),
            },
        },
        .debug = true,
    });
}
