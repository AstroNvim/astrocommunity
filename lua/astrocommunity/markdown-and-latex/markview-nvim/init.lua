return {
  "OXY2DEV/markview.nvim",
  ft = { "markdown", "markdown.mdx" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "html", "markdown", "markdown_inline" })
      end
    end,
  },
  opts = {
    hybrid_modes = { "n" },
    headings = { shift_width = 0 },
  },
}
