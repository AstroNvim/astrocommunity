return {
  "PaterJason/nvim-treesitter-sexp",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  enabled = false, -- plugin not compatible with nvim 0.11+
  ft = { "clojure", "fennel", "janet", "query" },
  cmd = "TSSexp",
  opts = {},
}
