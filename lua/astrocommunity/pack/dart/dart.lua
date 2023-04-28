local utils = require "astronvim.utils"
return {
  { import = "astrocommunity.pack.yaml" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the "dart" and "yaml" language to opts.ensure_installed.
      utils.list_insert_unique(opts.ensure_installed, "dart")
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" },
    init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "dartls") end,
    opts = {
      lsp = require("astronvim.utils.lsp").config "dartls",
      debugger = {
        enabled = true,
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
          -- Ensure that opts.ensure_installed exists and is a table.
          if not opts.ensure_installed then opts.ensure_installed = {} end
          utils.list_insert_unique(opts.ensure_installed, "dart")
        end,
      },
    },
  },
  -- Add "flutter" extension to "telescope"
  { "nvim-telescope/telescope.nvim", opts = function() require("telescope").load_extension "flutter" end },
}
