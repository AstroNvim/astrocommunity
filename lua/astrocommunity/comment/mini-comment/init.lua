return {
  { "numToStr/Comment.nvim", enabled = false },
  {
    "echasnovski/mini.comment",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    event = "User AstroFile",
    opts = {
      hooks = {
        pre = function() require("ts_context_commentstring.internal").update_commentstring {} end,
      },
    },
  },
}
