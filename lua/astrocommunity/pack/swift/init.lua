local utils = require "astronvim.utils"

return {
  {
    "xbase-lab/xbase",
    ft = { "swift", "objcpp", "objc" },
    run = "make install", -- or "make install && make free_space" (not recommended, longer build time)
    dependencies = {
      "AstroNvim/astrolsp",
      opts = function(_, opts) opts.servers = require("astrocore").list_insert_unique(opts.servers, "sourcekit-lsp") end,
    },
    opts = {},
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      if type(opts.sources) == "table" then
        vim.list_extend(opts.sources, {
          nls.builtins.formatting.swift_format,
        })
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "swift")
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "codelldb") end,
  },
}
