return {
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "haxe" } },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = {
      parsers = {
        haxe = {
          install_info = {
            url = "https://github.com/vantreeseba/tree-sitter-haxe",
            files = { "src/parser.c" },
            branch = "main",
          },
          filetype = "haxe",
        },
      },
    },
  },
}
