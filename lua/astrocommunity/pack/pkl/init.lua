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
