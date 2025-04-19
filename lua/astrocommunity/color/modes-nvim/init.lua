return {
  "mvllow/modes.nvim",
  version = "^0.2",
  event = "VeryLazy",
  opts = {},
  specs = {
    { "folke/which-key.nvim", optional = true, opts = { plugins = { presets = { operators = false } } } },
  },
}
