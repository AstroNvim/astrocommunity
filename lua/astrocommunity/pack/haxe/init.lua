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
    opts = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.haxe = {
        install_info = {
          url = "https://github.com/vantreeseba/tree-sitter-haxe",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "haxe",
      }
    end,
  },
}
