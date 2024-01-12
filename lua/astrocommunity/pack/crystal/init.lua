vim.filetype.add { extension = { cr = "crystal" } }

return {
  {
    "vim-crystal/vim-crystal",
    ft = { "crystal" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "crystalline")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "codelldb")
    end,
  },
}
