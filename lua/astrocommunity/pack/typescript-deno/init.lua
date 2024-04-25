return {
  { import = "astrocommunity.pack.json" },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "javascript", "typescript", "tsx" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "denols" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "js" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "deno", "js-debug-adapter" })
    end,
  },
  {
    "sigmasd/deno-nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    dependencies = { { "AstroNvim/astrolsp", optional = true, opts = { handlers = { denols = false } } } },
    opts = function(_, opts)
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      if astrolsp_avail then opts.server = astrolsp.lsp_opts "denols" end
    end,
  },
}
