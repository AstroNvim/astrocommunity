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
          -- if true then
          -- require("astronvim.utils").set_mappings()

          -- end
          vim.print(vim.inspect(client.server_capabilities))

          -- lsp_mappings.n["K"] = {
          --   function() vim.lsp.buf.hover() end,
          --   desc = "Hover symbol details",
          -- }
        end,
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "haskell", -- autocmd to start haskell-tools
        callback = function(_) require("haskell-tools").start_or_attach(opts) end,
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- optional
      -- TODO: Need haskell to be pulled into mason-nvim-dap (haskell hopefully coming soon)
      -- {
      --   "jay-babu/mason-nvim-dap.nvim",
      --   opts = function(_, opts)
      --     -- Ensure that opts.ensure_installed exists and is a table.
      --     if not opts.ensure_installed then opts.ensure_installed = {} end
      --     utils.list_insert_unique(opts.ensure_installed, "haskell-dap")
      --   end,
      -- },
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
}
