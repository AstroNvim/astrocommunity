return {
  {
    "dundalek/parpar.nvim",
    ft = { "clojure", "fennel", "scheme", "commonlisp" },
    opts = {},
  },
  { import = "astrocommunity.editing-support.nvim-parinfer" },
  { import = "astrocommunity.editing-support.nvim-paredit" },
}
