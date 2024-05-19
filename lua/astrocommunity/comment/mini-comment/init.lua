return {
  { "numToStr/Comment.nvim", enabled = false },
  {
    "echasnovski/mini.comment",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
    event = "User AstroFile",
    opts = {
      custom_commentstring = function()
        return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
