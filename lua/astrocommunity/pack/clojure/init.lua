-- ------------------------------------------
-- Clojure language pack
--
-- clojure-lsp server via mason
-- treesitter clojure parser
-- ts-comment.nvim with `;;` and `;` support
-- structured editing with parinfer and treesitter-sexp plugins
-- REPL connected editor with Conjure plugin (log HUD hidden by default)
-- ------------------------------------------

local plugins = {
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

  -- Conjure plugin for Clojure REPL
  { import = "astrocommunity.code-runner.conjure" },

  -- Parinfer parens management for Clojure
  { import = "astrocommunity.editing-support.nvim-parinfer" },

  -- Treesitter structural editing
  { import = "astrocommunity.editing-support.nvim-treesitter-sexp" },
}

if vim.fn.has "nvim-0.10" then table.insert(plugins, { import = "astrocommunity.comment.ts-comments-nvim" }) end

return plugins
