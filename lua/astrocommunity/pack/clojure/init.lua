-- Clojure support with Conjure plugin
local utils = require "astronvim.utils"
return {
  -- Clojure Language Server
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "clojure_lsp") end,
  },
  -- Clojure parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "clojure")
      end
    end,
  },
  -- Parinfer parens management for Clojure
  {
    "gpanders/nvim-parinfer",
    ft = { "clojure" },
    init = function()
      vim.g.parinfer_force_balance = true
      vim.g.parinfer_comment_chars = ";;"
    end,
  },
  -- Conjure plugin for Clojure REPL
  {
    "Olical/conjure",
    -- load plugin on filetypes
    ft = { "clojure" },
    init = function()
      vim.g["conjure#log#hud#width"] = 1
      vim.g["conjure#log#hud#enabled"] = false
      vim.g["conjure#log#hud#anchor"] = "SE"
      vim.g["conjure#log#botright"] = true
      vim.g["conjure#extract#context_header_lines"] = 100
      vim.g["conjure#eval#comment_prefix"] = ";; "
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil
      vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
      vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"

      vim.api.nvim_create_autocmd("BufNewFile", {
        group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
        pattern = { "conjure-log-*" },
        callback = function() vim.diagnostic.disable(0) end,
        desc = "Conjure Log disable LSP diagnostics",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("comment_config", { clear = true }),
        pattern = { "clojure" },
        callback = function() vim.bo.commentstring = ";; %s" end,
        desc = "Lisp style line comment",
      })
    end,
  },
}
