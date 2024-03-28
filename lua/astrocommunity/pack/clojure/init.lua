-- Clojure support with Conjure plugin
return {
  -- Clojure Language Server
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "clojure_lsp" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "clojure-lsp" })
    end,
  },
  -- Clojure parser
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "clojure" })
      end
    end,
  },
  -- Parinfer parens management for Clojure
  {
    "gpanders/nvim-parinfer",
    ft = { "clojure" },
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        options = { g = {
          parinfer_force_balance = true,
          parinfer_comment_chars = ";;",
        } },
      },
    },
  },
  -- Conjure plugin for Clojure REPL
  {
    "Olical/conjure",
    -- load plugin on filetypes
    ft = { "clojure" },
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          conjure_log_disable_lsp = {
            {
              event = "BufNewFile",
              pattern = { "conjure-log-*" },
              callback = function() vim.diagnostic.disable(0) end,
              desc = "Conjure Log disable LSP diagnostics",
            },
            {
              event = "FileType",
              pattern = { "clojure" },
              callback = function() vim.bo.commentstring = ";; %s" end,
              desc = "Lisp style line comment",
            },
          },
        },
        options = {
          g = {
            ["conjure#log#hud#width"] = 1,
            ["conjure#log#hud#enabled"] = false,
            ["conjure#log#hud#anchor"] = "SE",
            ["conjure#log#botright"] = true,
            ["conjure#extract#context_header_lines"] = 100,
            ["conjure#eval#comment_prefix"] = ";; ",
            ["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false,
            ["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true,
            ["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil,
            ["conjure#client#clojure#nrepl#eval#auto_require"] = false,
            ["conjure#client#clojure#nrepl#test#runner"] = "kaocha",
          },
        },
      },
    },
  },
}
