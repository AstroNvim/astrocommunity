return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "User AstroFile",
    main = "rainbow-delimiters.setup",
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { rainbow_delimiters = true } },
  },
}
