return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  init = function() require("astronvim.utils.ui").toggle_diagnostics() end,
  opts = {},
}
