return {
  { "neo-tree.nvim", enabled = false },
  {
    "echasnovski/mini.files",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            ["<Leader>e"] = { function() require("mini.files").open() end, desc = "Explorer" },
          },
        },
      },
    },
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { mini = true } },
  },
}
