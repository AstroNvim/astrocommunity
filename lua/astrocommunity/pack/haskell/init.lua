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
    branch = "2.x.x", -- Recommended
    init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "hls") end,
    opts = function(_, opts)
      -- this allows users to pass opts through an opts table in community.lua
      opts = opts or {}
      local defaults = {
        hls = {
          on_attach = function(client, bufnr, _) require("astronvim.utils.lsp").on_attach(client, bufnr) end,
        },
      }
      opts = vim.tbl_deep_extend("keep", opts, defaults)
      return opts
    end,
    config = function(_, opts)
      -- haskell-tools reads this config the first time `require('haskell-tools')` is called,
      -- which is typically when opening a Haskell or Cabal file, or when the
      -- user executes one of the plugin's commands.
      -- NOTE: If vim.g.haskell_tools has already been set, its options take precedence.
      vim.g.haskell_tools = vim.tbl_deep_extend("keep", vim.g.haskell_tools or {}, opts)
    end,
    -- load the plugin when opening one of the following file types
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
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
