local utils = require "astronvim.utils"

return {
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" } },
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "angular")
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "angularls") end,
  },
}
