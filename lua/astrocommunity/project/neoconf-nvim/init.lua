return {
  "folke/neoconf.nvim",
  cmd = "Neoconf",
  opts = {},
  specs = {
    { "neovim/nvim-lspconfig", optional = true, dependencies = { "folke/neoconf.nvim" } },
  },
}
