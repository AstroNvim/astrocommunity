return {
  {
    "moonbit-community/moonbit.nvim",
    ft = "moonbit",
    -- uncomment when mason support added to make sure command is available
    -- dependencies = {
    --   { "williamboman/mason.nvim", optional = true },
    -- },
    opts = function(_, opts)
      -- only enable treesitter if the plugin is available
      if not require("astrocore").is_available "nvim-treesitter" then opts.treesitter = { enabled = false } end
      -- only enable the LSP if the lsp command is executable
      if vim.fn.executable "moonbit-lsp" == 1 then
        local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
        if astrolsp_avail then opts.lsp = astrolsp.lsp_opts "moonbit" end
      else
        opts.lsp = false
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "moonbit-community/moonbit.nvim" },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-moonbit")
    end,
  },
  -- uncomment if/when moonbit-lsp is added to lspconfig and mason-lspconfig
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "harper-ls" })
  --   end,
  -- },
  -- uncomment when merged upstream: https://github.com/mason-org/mason-registry/pull/7350
  -- {
  --   "WhoIsSethDaniel/mason-tool-installer.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "moonbit-lsp" })
  --   end,
  -- },
}
