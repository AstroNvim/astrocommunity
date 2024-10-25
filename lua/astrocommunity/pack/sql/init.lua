return {
  {
    "AstroNvim/astrocore",
    opts = {
      filetypes = {
        extension = {
          pg = "sql",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "sql" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "sqls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "sqls" })
    end,
  },
  {
    "nanotee/sqls.nvim",
    lazy = true,
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          sqls_attach = {
            {
              event = "LspAttach",
              desc = "Load sqls.nvim with sqls",
              callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                if client.name == "sqls" then require("sqls").on_attach(client, args.buf) end
              end,
            },
          },
        },
      },
    },
  },
}
