local utils = require "astrocore.utils"

return {
  { import = "astrocommunity.pack.json" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "javascript", "typescript", "tsx" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "denols") end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "js") end,
  },
  {
    "sigmasd/deno-nvim",
    init = function() astrocore.lsp.skip_setup = utils.list_insert_unique(astrocore.lsp.skip_setup, "denols") end,
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    opts = function() return { server = require("astrocore.utils.lsp").config "denols" } end,
  },
}
