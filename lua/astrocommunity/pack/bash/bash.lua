return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the "julia" and "toml" language to opts.ensure_installed.
      table.insert(opts.ensure_installed, "bash")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add julia lsp and toml lsp to ensure_installed
      table.insert(opts.ensure_installed, "bashls")
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add julia lsp and toml lsp to ensure_installed
      vim.list_extend(opts.ensure_installed, { "shellcheck", "shfmt" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add julia lsp and toml lsp to ensure_installed
      table.insert(opts.ensure_installed, "bash")
    end,
  },
}
