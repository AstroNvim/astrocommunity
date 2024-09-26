return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = { pkl = "pkl", pcf = "pkl" },
        filename = { PklProject = "pkl" },
      },
    },
  },
  {
    "apple/pkl-neovim",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        optional = true,
        opts = function(_, opts)
          local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

          parser_config.pkl = {
            install_info = {
              url = "https://github.com/apple/tree-sitter-pkl",
              files = { "src/parser.c", "src/scanner.c" },
              branch = "main",
            },
            filetype = "pkl",
            used_by = { "pcf" },
          }

          if opts.ensure_installed ~= "all" then
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "pkl" })
          end
        end,
      },
    },
    ft = "pkl",
  },
}
