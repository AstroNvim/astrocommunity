return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/neoconf.nvim",
      cmd = "Neoconf",
      init = function()
        require("astronvim.utils").notify(
          "`Neoconf.nvim` has been included upstream!\nPlease remove from your community plugins.",
          vim.log.levels.WARN
        )
      end,
      opts = {},
    },
  },
}
