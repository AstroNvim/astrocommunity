local utils = require "astrocore"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "powershell_es") end,
  },
  { "PProvost/vim-ps1", ft = "ps1" },
}
