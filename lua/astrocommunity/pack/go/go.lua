return {
  -- Golang support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the "go" language to opts.ensure_installed.
      table.insert(opts.ensure_installed, "go")
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add go lsps to opts.ensure_installed using vim.list_extend.
      vim.list_extend(opts.ensure_installed, { "gomodifytags", "gofumpt", "iferr", "impl", "goimports" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      table.insert(opts.ensure_installed, "gopls")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    config = true,
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
          -- Ensure that opts.ensure_installed exists and is a table.
          if not opts.ensure_installed then opts.ensure_installed = {} end
          table.insert(opts.ensure_installed, "delve")
        end,
      },
    },
  },
  {
    "olexsmir/gopher.nvim",
    opts = function() return { server = require("core.utils.lsp").config "gopls" } end,
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
  },
}
