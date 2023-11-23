return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  depdencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          ["<Leader>O"] = { function() require("oil").open() end, desc = "Open folder in Oil" },
        },
      },
    },
  },
  opts = {},
}
