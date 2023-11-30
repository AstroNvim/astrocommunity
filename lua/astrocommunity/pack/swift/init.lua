local utils = require "astronvim.utils"

return {
  {
    "xbase-lab/xbase",
    ft = {
      "swift",
      "objcpp",
      "objc",
    },
    run = "make install", -- or "make install && make free_space" (not recommended, longer build time)
    dependencies = {
      "neovim/nvim-lspconfig",
      -- "nvim-telescope/telescope.nvim", -- optional
      -- "nvim-lua/plenary.nvim", -- optional/requirement of telescope.nvim
      -- "stevearc/dressing.nvim", -- optional (in case you don't use telescope but something else)
    },
    init = function() require("astronvim.utils.lsp").setup "sourcekit" end,
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
