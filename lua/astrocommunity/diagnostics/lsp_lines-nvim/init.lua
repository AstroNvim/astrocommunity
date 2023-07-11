return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  keys = {
    {
      "<Leader>uD",
      function()
        vim.diagnostic.config {
          virtual_text = not require("lsp_lines").toggle(),
        }
      end,
      desc = "Toggle virtual diagnostic lines",
    },
  },
  init = function() require("astronvim.utils.ui").toggle_diagnostics() end,
  opts = {},
}
