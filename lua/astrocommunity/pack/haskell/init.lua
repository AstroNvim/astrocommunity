local utils = require "astrocore"
return {
  { import = "astrocommunity.pack.yaml" }, -- stack.yaml
  { import = "astrocommunity.pack.json" }, -- hls.json
  {
    "AstroNvim/astrolsp",
    opts = {
      handlers = { hls = false },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "haskell")
      end
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    ft = { "haskell" },
    branch = "1.x.x", -- recommended by haskell-tools
    opts = {
      hls = {
        on_attach = function(client, bufnr) require("astrolsp").on_attach(client, bufnr) end,
      },
    },
    config = function(_, opts)
      local tools = require "haskell-tools"
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "haskell", -- autocmd to start haskell-tools
        callback = function() tools.start_or_attach(opts) end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        pattern = "*.hs", -- autocmd to start haskell-tools
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.name == "haskell-tools.nvim" then tools.dap.discover_configurations(args.buf) end
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
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "hls") end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "haskell") end,
  },
}
