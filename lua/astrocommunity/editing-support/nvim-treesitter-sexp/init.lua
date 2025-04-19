return {
  "PaterJason/nvim-treesitter-sexp",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  enabled = vim.fn.has "nvim-0.11" == 0,
  ft = { "clojure", "fennel", "janet", "query" },
  cmd = "TSSexp",
  opts = {},
}
