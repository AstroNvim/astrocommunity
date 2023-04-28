local utils = require "astrocommunity.utils"

return {
  { import = "astrocommunity.pack.json" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the required file types to opts.ensure_installed.
      utils.list_insert_unique(opts.ensure_installed, { "javascript", "typescript", "tsx" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add denols to opts.ensure_installed using vim.list_extend.
      utils.list_insert_unique(opts.ensure_installed, "denols")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add to opts.ensure_installed using table.insert.
      utils.list_insert_unique(opts.ensure_installed, "js")
    end,
  },
  {
    "sigmasd/deno-nvim",
    init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "denols") end,
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    opts = function() return { server = require("astronvim.utils.lsp").config "denols" } end,
  },
}
