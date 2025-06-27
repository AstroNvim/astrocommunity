return {
  {
    "srghma/nvimmer-ps",
    opts = {}, -- if nil - M.setup wont be called
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = { purs = "purescript" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "purescript" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "purescriptls" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "purs-tidy" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "purescript-language-server",
        "purescript-tidy",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        purescript = { "purs-tidy" },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      config = {
        purescriptls = {
          flags = {
            debounce_text_changes = 150,
          },
          -- root_dir fixes
          -- "Problem running build: Reading Spago workspace configuration...\n\n✘ Your spago.yaml doesn't contain a workspace section."
          -- when language server is being run in a monorepo (lot of spago.yaml files, but only the top one has "workspace section")
          root_dir = function(_) return vim.fn.getcwd() end,
          on_attach = function(...) require("nvimmer-ps").setup_on_attach(...) end,
          on_init = function(...) require("nvimmer-ps").setup_on_init(...) end,
          settings = {
            purescript = {
              formatter = "purs-tidy",
              addSpagoSources = true,
            },
          },
        },
      },
    },
  },
}
