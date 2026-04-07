return {
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        treesitter_haxe = {
          {
            desc = "Regiser Haxe treesitter parser",
            event = "User",
            pattern = "TSUpdate",
            callback = function()
              require("nvim-treesitter.parsers").haxe = {
                tier = 4,
                install_info = {
                  url = "https://github.com/vantreeseba/tree-sitter-haxe",
                  revision = "HEAD",
                },
              }
            end,
          },
        },
      },
      treesitter = { ensure_installed = { "haxe" } },
    },
  },
}
