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
        opts = {
          parsers = {
            pkl = {
              install_info = {
                url = "https://github.com/apple/tree-sitter-pkl",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "main",
              },
              filetype = "pkl",
              used_by = { "pcf" },
            },
          },
        },
      },
      {
        "AstroNvim/astrocore",
        optional = true,
        ---@type AstroCoreOpts
        opts = {
          treesitter = { ensure_installed = { "pkl" } },
        },
      },
    },
    ft = "pkl",
  },
}
