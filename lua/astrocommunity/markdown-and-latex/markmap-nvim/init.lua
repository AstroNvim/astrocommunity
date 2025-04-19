--  [markdown markmap]
--  https://github.com/Zeioth/markmap.nvim
return {
  "Zeioth/markmap.nvim",
  cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
  ft = "markdown",
  opts = {
    hide_toolbar = "false",
  },
  specs = {
    {
      "jay-babu/mason-null-ls.nvim",
      optional = true,
      opts = function(_, opts)
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "markmap-cli" })
      end,
    },
  },
}
