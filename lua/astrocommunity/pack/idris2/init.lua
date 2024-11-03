return {
  {
    -- "ShinKage/idris2-nvim",
    dir = "/home/srghma/projects/idris2-nvim",
    config = function(_, opts)
      -- require("idris2").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        -- , "ipkg"
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "idris2" })
      end
    end,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = {
          idr = "idris",
          ipkg = "ipkg",
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      -- NOTE:
      -- THIS will enable server it is not installed by Mason (to use idris2-lsp program from $PATH)
      -- alternatively, can use `ensure_installed` from `williamboman/mason-lspconfig.nvim`, it will setup handlers, but adding idris2-lsp to mason registry is tricky
      -- https://github.com/williamboman/mason-lspconfig.nvim/pull/482
      -- https://github.com/mason-org/mason-registry/pull/7724
      servers = { "idris2_lsp" },
      config = {
        idris2_lsp = {
          before_init = function(init_params, config)
            init_params.initializationOptions = {
              logFile = "/tmp/idris2.log",
              logSeverity = "debug",
            }
          end,
          filetypes = { 'idris' }, -- nvim-treesitter defines idris2 files as 'idris' filetype, for more info - https://github.com/kayhide/tree-sitter-idris/issues/5
          root_dir = function(...) return require('idris2').setup__root_dir_or_error(...) end,
          on_attach = function(...) return require('idris2').setup__on_attach(...) end,
        },
      },
    },
  },
}
