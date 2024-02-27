return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>uD"] = { function() require("lsp_lines").toggle() end, desc = "Toggle virtual diagnostic lines" },
          },
        },
      },
    },
    {
      "AstroNvim/astrolsp",
      opts = {
        diagnostics = {
          virtual_text = false,
        },
      },
    },
  },
  opts = {},
}
