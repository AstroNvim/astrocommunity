local utils = require "astronvim.utils"
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        utils.list_insert_unique(opts.ensure_installed, "docker-compose-language-service", "dockerfile-language-server")
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "hadolint") end,
  },
}
