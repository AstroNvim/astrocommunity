local utils = require "astronvim.utils"
return {
  { import = "astrocommunity.pack.toml" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "julia")
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "julials") end,
  },
  {
    "hrsh7th/nvim-cmp",
    -- add cmp latex symbols for easier julia editing
    dependencies = { "kdheepak/cmp-latex-symbols" },
    opts = function(_, opts)
      if not opts.sources then opts.sources = {} end
      table.insert(opts.sources, { name = "latex_symbols", priority = 700 })
    end,
  },
}
