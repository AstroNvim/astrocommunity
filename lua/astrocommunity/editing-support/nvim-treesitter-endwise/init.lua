return {
  "RRethy/nvim-treesitter-endwise",
  lazy = true,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "RRethy/nvim-treesitter-endwise" },
    },
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        treesitter = {
          endwise = { enable = true },
        },
      },
    },
  },
}
