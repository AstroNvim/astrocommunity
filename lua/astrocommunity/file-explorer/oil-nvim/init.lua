return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {},
  enabled = true,
  cmd = "Oil",
  keys = {
    { "<leader>O", function() require("oil").open() end, desc = "Open folder in Oil" },
  },
}
