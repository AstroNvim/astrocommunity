return {
  { import = "astrocommunity.pack.toml" },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "julia" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "julials" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "julia-lsp" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    -- add cmp latex symbols for easier julia editing
    dependencies = { "kdheepak/cmp-latex-symbols" },
    opts = function(_, opts)
      if not opts.sources then opts.sources = {} end
      table.insert(opts.sources, { name = "latex_symbols", priority = 700 })
    end,
  },
}
