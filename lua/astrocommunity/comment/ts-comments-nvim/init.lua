return {
  { "numToStr/Comment.nvim", enabled = false },
  { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
}
