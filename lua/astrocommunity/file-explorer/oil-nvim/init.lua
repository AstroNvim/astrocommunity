return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        ["<leader>O"] = { function() require("oil").open() end, desc = "Open folder in Oil" },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    enabled = true,
    cmd = "Oil",
  },
}
