local utils = require "astrocommunity.utils"
return {
  { import = "astrocommunity.pack.yaml" }, -- stack.yaml
  { import = "astrocommunity.pack.json" }, -- hls.json
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- ensure haskell treesitter installed
      utils.list_insert_unique(opts.ensure_installed, "haskell")
    end,
  },

  {
    "mrcjkb/haskell-tools.nvim",
    ft = { "haskell" },
    branch = "1.x.x", -- reccomended by haskell-tools
    init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "hls") end,
    opts = {
      hls = {
        on_attach = function(client, bufnr)
          local ht = require "haskell-tools"
          require("astronvim.utils.lsp").on_attach(client, bufnr)
        end,
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "haskell", -- autocmd to start haskell-tools
        callback = function() require("haskell-tools").start_or_attach(opts) end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        pattern = "*.hs", -- autocmd to start haskell-tools
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.name == "haskell-tools.nvim" then require("haskell-tools").dap.discover_configurations(args.buf) end
        end,
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      utils.list_insert_unique(opts.ensure_installed, "hls")
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      utils.list_insert_unique(opts.ensure_installed, "haskell")
    end,
  },
}
