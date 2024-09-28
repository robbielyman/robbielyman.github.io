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
            
            "fonts/Taviraj-Regular.ttf",
            "fonts/Taviraj-Black.ttf",
            "fonts/Taviraj-BlackItalic.ttf",
            "fonts/Taviraj-Bold.ttf",
            "fonts/Taviraj-BoldItalic.ttf",
            "fonts/Taviraj-Italic.ttf",
            "fonts/Taviraj-Light.ttf",
            "fonts/Taviraj-LightItalic.ttf",
            
            "fonts/Sarabun-Regular.ttf",
            "fonts/Sarabun-Bold.ttf",
            "fonts/Sarabun-BoldItalic.ttf",
            "fonts/Sarabun-Italic.ttf",
            "fonts/Sarabun-Light.ttf",
            "fonts/Sarabun-LightItalic.ttf",
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
