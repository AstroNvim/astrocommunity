-- ------------------------------------------
-- Clojure language pack
--
-- clojure-lsp server via mason
-- treesitter clojure parser
-- treesitter comments with `;;` and `;` support
-- structured editing with parinfer and paredit plugins
-- REPL connected editor with Conjure plugin
-- ------------------------------------------

local plugins = {
  -- Clojure Language Server
  {
    "mason-org/mason-lspconfig.nvim",
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
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "clojure" } },
    },
  },

  -- Conjure plugin for Clojure REPL
  { import = "astrocommunity.code-runner.conjure" },

  -- Parinfer & Paredit structural editing for Lisp dialects
  { import = "astrocommunity.editing-support.parpar-nvim" },

  -- Better treesitter comments
  { import = "astrocommunity.comment.ts-comments-nvim" },
}

return plugins
