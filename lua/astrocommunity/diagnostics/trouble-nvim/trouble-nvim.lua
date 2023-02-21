local prefix = "<leader>x"
return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { prefix, desc = "Trouble" },
      { prefix .. "X", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { prefix .. "x", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { prefix .. "l", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { prefix .. "q", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
  },
}
