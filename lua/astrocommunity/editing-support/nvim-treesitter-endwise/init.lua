return {
  "RRethy/nvim-treesitter-endwise",
  lazy = true,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "RRethy/nvim-treesitter-endwise" },
      opts = {
        endwise = { enable = true },
      },
    },
  },
}
