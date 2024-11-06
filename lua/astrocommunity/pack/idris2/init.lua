return {
  {
    -- "ShinKage/idris2-nvim",
    dir = "/home/srghma/projects/idris2-nvim",
    config = function(_, _opts)
      -- require("idris2").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "idris2", "ipkg" })
      end
      -- will make ```idris foo = 1 + 2 ``` in markdown work
      -- when idris3 will be released - just replace idris2 with idris3
      vim.treesitter.language.register("idris2", "idris")
    end,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = {
          idr = "idris", -- NOTE: also makes ```idr foo = 1 + 2 ``` in markdown work
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
          before_init = function(init_params, _config)
            init_params.initializationOptions = {
              logFile = "/tmp/idris2.log",
              logSeverity = "debug",
            }
          end,
          cmd = { vim.fn.expand('$HOME/projects/idris2-lsp/result/bin/idris2-lsp') },
          -- or
          -- -- nix build --expr 'with import ./. { }; pkgs.buildEnv { name = "my-idris"; paths = [ pkgs.idris2Packages.idris2 pkgs.idris2Packages.idris2Lsp ]; }' --offline --impure
          -- cmd = { cmd = { vim.fn.expand('$HOME/projects/idris2-lsp/result/bin/idris2-lsp') }, "/home/srghma/projects/nixpkgs/result/bin/idris2-lsp" },
          filetypes = { "idris" }, -- nvim-treesitter only works in "idris2" filetypes by default
          root_dir = function(...) return require("idris2").setup__root_dir_or_error(...) end,
          on_attach = function(...) return require("idris2").setup__on_attach(...) end,
        },
      },
    },
  },
}
