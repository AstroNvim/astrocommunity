return {
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "uga-rosa/ccc.nvim",
    event = "User AstroFile",
    keys = { { "<leader>uC", "<cmd>CccPick<cr>", desc = "Toggle colorizer" } },
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
  },
}
