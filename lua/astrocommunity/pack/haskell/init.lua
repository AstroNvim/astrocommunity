local utils = require "astrocore"
return {
  { import = "astrocommunity.pack.yaml" }, -- stack.yaml
  { import = "astrocommunity.pack.json" }, -- hls.json
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      handlers = { hls = false },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
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
      local astrolsp = require "astrolsp"
      vim.g.haskell_tools = utils.extend_tbl({
        hls = { capabilities = astrolsp.config.capabilities, on_attach = astrolsp.on_attach },
      }, vim.g.haskell_tools)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "hls") end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "haskell") end,
  },
}
