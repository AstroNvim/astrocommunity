return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { filetypes = { pattern = { [".*%.blade%.php"] = "blade" } } },
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.config.blade = {
        cmd = { "laravel-dev-generators", "lsp" },
        filetypes = { "blade" },
        root_dir = function(fname) return vim.fs.root(fname, ".git") end,
      }

      if vim.fn.executable "laravel-dev-generators" == 1 then
        opts.servers = require("astrocore").list_insert_unique(opts.servers, { "blade" })
      end
    end,
  },
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "blade" } },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "blade_formatter" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "blade-formatter" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter" },
      },
    },
  },
}
