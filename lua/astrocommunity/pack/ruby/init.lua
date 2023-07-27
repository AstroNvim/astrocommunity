local utils = require "astronvim.utils"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "ruby")
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    ft = { "ruby" },
    dependencies = { "zidhuss/neotest-minitest" },
    opts = function(_, opts) opts.adapters = utils.list_insert_unique(opts.adapters, "neotest-minitest") end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "solargraph") end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "standardrb") end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "suketa/nvim-dap-ruby",
      name = "dap-ruby",
      opts = {},
    },
  },
}
