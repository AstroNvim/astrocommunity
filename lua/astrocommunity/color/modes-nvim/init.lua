return {
  { "folke/which-key.nvim", optional = true, opts = { plugins = { presets = { operators = false } } } },
  {
    "mvllow/modes.nvim",
    version = "^0.2",
    event = "VeryLazy",
    opts = {},
  },
}
