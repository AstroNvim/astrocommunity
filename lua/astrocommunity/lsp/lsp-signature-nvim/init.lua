return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "ray-x/lsp_signature.nvim",
    opts = {
      hint_enable = false, -- disable hints as it will crash in some terminal
    },
  },
}
