local utils = require "astronvim.utils"

return {
  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup {
        picker = "telescope",
      }
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "zk") end,
  },
}
