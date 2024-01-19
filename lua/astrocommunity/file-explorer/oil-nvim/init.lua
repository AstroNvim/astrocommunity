return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>O"] = { function() require("oil").open() end, desc = "Open folder in Oil" },
          },
        },
      },
    },
  },
  opts = {},
}
