-- nnoremap <buffer> <silent> <LocalLeader>t :call IdrisShowType()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>r :call IdrisReload(0)<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>c :call IdrisCaseSplit()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>a 0:call search(":")<ENTER>b:call IdrisAddClause(0)<ENTER>w
-- nnoremap <buffer> <silent> <LocalLeader>d 0:call search(":")<ENTER>b:call IdrisAddClause(0)<ENTER>w
-- nnoremap <buffer> <silent> <LocalLeader>b 0:call IdrisAddClause(0)<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>m :call IdrisAddMissing()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>md 0:call search(":")<ENTER>b:call IdrisAddClause(1)<ENTER>w
-- nnoremap <buffer> <silent> <LocalLeader>f :call IdrisRefine()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>o :call IdrisProofSearch(0)<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>s :call IdrisProofSearch(0)<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>g :call IdrisGenerateDef()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>p :call IdrisProofSearch(1)<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>l :call IdrisMakeLemma()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>e :call IdrisEval()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>w 0:call IdrisMakeWith()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>mc :call IdrisMakeCase()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>i 0:call IdrisResponseWin()<ENTER>
-- nnoremap <buffer> <silent> <LocalLeader>h :call IdrisShowDoc()<ENTER>

return {
  {
    -- "ShinKage/idris2-nvim",
    dir = "/home/srghma/projects/idris2-nvim",
    config = function(_, opts)
      -- require("idris2").setup(opts)
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   optional = true,
  --   opts = function(_, opts) require("astrocore").list_insert_unique(opts.ensure_installed, { "idris", "ipkg" }) end,
  -- },
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
          filetypes = { 'idris' }, -- nvim-treesitter defines idris2 files as 'idris' filetype
          root_dir = function(...) return require('idris2').setup__root_dir_or_error(...) end,
          on_init = function(client)
          end,
          on_attach = function(...) return require('idris2').setup__on_attach(...) end,
        },
      },
    },
  },
}
