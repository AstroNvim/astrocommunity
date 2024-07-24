return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        helm_commentstring = {
          {
            event = "FileType",
            pattern = "helm",
            callback = function() vim.opt_local.commentstring = "{{/* %s */}}" end,
          },
        },
      },
      filetypes = {
        extension = { gotmpl = "helm" },
        pattern = {
          [".*/templates/.*%.ya?ml"] = "helm",
          [".*/templates/.*%.tpl"] = "helm",
          ["helmfile.*%.ya?ml"] = "helm",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "helm" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "helm_ls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "helm-ls" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        helm = { "prettierd", "prettier" },
      },
    },
  },
}
