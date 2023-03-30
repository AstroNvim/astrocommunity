return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function(_, opts) require("nvim-surround").setup(opts) end,
  },
}
