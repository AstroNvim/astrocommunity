return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "elixir", "heex", "eex" })
      end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "expert" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "expert" })
    end,
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = function(_, opts)
      local configs = require "lspconfig.configs"
      if not configs.expert then
        configs.expert = {
          default_config = {
            cmd = { "expert", "--stdio" },
            root_dir = function(fname) return require("lspconfig").util.root_pattern("mix.exs", ".git")(fname) end,
            filetypes = { "elixir", "eelixir", "heex" },
            settings = {},
          },
        }
      end
      opts.servers = require("astrocore").list_insert_unique(opts.servers, { "expert" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        elixir = { "mix" },
        heex = { "mix" },
        eex = { "mix" },
      },
    },
  },
}
