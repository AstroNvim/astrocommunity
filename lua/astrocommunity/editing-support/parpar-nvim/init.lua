local plugins = {
  -- parinfer & paredit structural editing
  {
    "dundalek/parpar.nvim",
    ft = { "clojure", "fennel", "scheme", "commonlisp" },
    opts = {},
  },

  -- Dependencies

  -- Parinfer structural editing
  { import = "astrocommunity.editing-support.nvim-parinfer" },

  -- Paredit structural editing
  { import = "astrocommunity.editing-support.nvim-paredit" },
}

return plugins
