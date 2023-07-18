return {
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "markdown", "norg", "org", "rmd" },
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { headlines = true } },
  },
}
