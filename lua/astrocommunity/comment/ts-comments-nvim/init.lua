return {
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = vim.fn.has "nvim-0.10.0" == 1,
  specs = {
    { "numToStr/Comment.nvim", optional = true, enabled = false },
    { "JoosepAlviste/nvim-ts-context-commentstring", optional = true, enabled = false },
  },
}
