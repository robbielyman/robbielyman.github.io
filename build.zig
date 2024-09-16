const std = @import("std");
const zine = @import("zine");

pub fn build(b: *std.Build) !void {
    zine.website(b, .{
        .title = "Alanza – Robbie Lyman",
        .host_url = "https://alanza.xyz",
        .layouts_dir_path = "layouts",
        .content_dir_path = "content",
        .assets_dir_path = "assets",
        .static_assets = &.{},
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
