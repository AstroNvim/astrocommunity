return {
  "OXY2DEV/helpview.nvim",
  ft = "help",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "astrocore",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "vimdoc" })
      end
    end,
  },
}
