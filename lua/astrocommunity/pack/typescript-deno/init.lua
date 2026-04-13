return {
  { import = "astrocommunity.pack.json" },
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "javascript", "typescript", "tsx" } },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
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
    opts = function(_, opts) opts.server = vim.lsp.config["denols"] or {} end,
  },
}
