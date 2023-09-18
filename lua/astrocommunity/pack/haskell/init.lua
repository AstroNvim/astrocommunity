local utils = require "astronvim.utils"
return {
  { import = "astrocommunity.pack.yaml" }, -- stack.yaml
  { import = "astrocommunity.pack.json" }, -- hls.json
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "haskell")
      end
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope.nvim", optional = true },
      { "mfussenegger/nvim-dap", optional = true },
    },
    version = "^2",
    -- load the plugin when opening one of the following file types
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    init = function()
      astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "hls")
      vim.g.haskell_tools = vim.tbl_deep_extend("keep", vim.g.haskell_tools or {}, {
        hls = {
          on_attach = function(client, bufnr, _) require("astronvim.utils.lsp").on_attach(client, bufnr) end,
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "hls") end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "haskell") end,
  },
}
