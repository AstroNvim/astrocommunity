return {
  "sustech-data/wildfire.nvim",
  event = "BufEnter",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function() require("wildfire").setup() end,
}
