return {
  { "numToStr/Comment.nvim", enabled = false },
  {
    "echasnovski/mini.comment",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    init = function() table.insert(astronvim.file_plugins, "mini.comment") end,
    opts = {
      hooks = {
        pre = function() require("ts_context_commentstring.internal").update_commentstring {} end,
      },
    },
    config = function(_, opts) require("mini.comment").setup(opts) end,
  },
}
