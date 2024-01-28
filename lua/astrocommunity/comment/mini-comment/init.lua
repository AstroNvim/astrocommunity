return {
  { "numToStr/Comment.nvim", enabled = false },
  {
    "echasnovski/mini.comment",
    event = "User AstroFile",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
    opts = {
      custom_commentstring = function()
        return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
      end,
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
