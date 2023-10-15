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
    init = function() require("astronvim.utils.lsp").setup "sourcekit-lsp" end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      if type(opts.sources) == "table" then
        vim.list_extend(opts.sources, {
          nls.builtins.formatting.swift_format,
        })
      end
    end,
  },
}
