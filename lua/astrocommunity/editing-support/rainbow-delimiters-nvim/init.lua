return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "User AstroFile",
    config = function(_, opts) require "rainbow-delimiters.setup"(opts) end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { rainbow_delimiters = true } },
  },
}
