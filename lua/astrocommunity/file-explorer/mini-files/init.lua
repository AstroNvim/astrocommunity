return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        ["<leader>e"] = { function() require("mini.files").open() end, desc = "Explorer" },
      },
    },
  },
  {
    "neo-tree.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.files",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { mini = true } },
  },
}
