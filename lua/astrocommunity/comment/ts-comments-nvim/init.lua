return {
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = true,
  specs = {
    { "numToStr/Comment.nvim", optional = true, enabled = false },
    { "JoosepAlviste/nvim-ts-context-commentstring", optional = true, enabled = false },
  },
}
