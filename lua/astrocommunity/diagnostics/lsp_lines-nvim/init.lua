return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>uD"] = { function() require("lsp_lines").toggle() end, desc = "Toggle virtual diagnostic lines" },
        },
      },
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    opts = {},
    config = function(_, opts)
      -- disable diagnostic virtual text
      local lsp_utils = require "astrolsp"

      lsp_utils.diagnostics[3].virtual_text = false
      vim.diagnostic.config(lsp_utils.diagnostics[vim.g.diagnostics_mode])
      require("lsp_lines").setup(opts)
    end,
  },
}
