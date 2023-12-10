local utils = require "astrocore"

return {
  {
    "mickael-menu/zk-nvim",
    opts = {
      picker = "telescope",
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "zk") end,
  },
}
