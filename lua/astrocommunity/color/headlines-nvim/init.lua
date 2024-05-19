return {
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "markdown", "norg", "org", "rmd" },
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { headlines = true } },
  },
}
