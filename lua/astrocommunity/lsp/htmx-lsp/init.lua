---@type LazySpec
return {
  {
    "ThePrimeagen/htmx-lsp",
    ft = { "htmx" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "htmx" })
    end,
  },
}
