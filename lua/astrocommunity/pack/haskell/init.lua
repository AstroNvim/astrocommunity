local utils = require "astronvim.utils"
local haskell_ft = { "haskell", "lhaskell", "cabal", "cabalproject" }

return {
  { import = "astrocommunity.pack.yaml" }, -- stack.yaml
  { import = "astrocommunity.pack.json" }, -- hls.json
  { import = "astrocommunity.test.neotest" }, -- neotest-haskell
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
    ft = haskell_ft,
    dependencies = {
      -- vim.fn.has >= nvim 0.9 removes plenary dependency
      { "nvim-lua/plenary.nvim", optional = vim.fn.has "nvim-0.9" == 1 and true or false },
      { "nvim-telescope/telescope.nvim", optional = true },
      { "mfussenegger/nvim-dap", optional = true },
    },
    -- vim.fn.has >= nvim 0.9 installs version 3
    version = vim.fn.has "nvim-0.9" == 1 and "^3" or "^2",
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
  {
    "mrcjkb/haskell-snippets.nvim",
    ft = haskell_ft,
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
      local haskell_snippets = require("haskell-snippets").all
      require("luasnip").add_snippets("haskell", haskell_snippets, { key = "haskell" })
    end,
  },
  {
    "luc-tielen/telescope_hoogle",
    optional = true,
    ft = haskell_ft,
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then telescope.load_extension "hoogle" end
    end,
  },
  {
    "nvim-neotest/neotest",
    ft = haskell_ft,
    dependencies = {
      { "mrcjkb/neotest-haskell" },
    },
    opts = {
      adapters = {
        ["neotest-haskell"] = {},
      },
    },
  },
}
