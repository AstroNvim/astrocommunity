return {
  "OXY2DEV/markview.nvim",
  ft = function()
    local plugin = require("lazy.core.config").spec.plugins["markview.nvim"]
    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
    return opts.filetypes or { "markdown", "quarto", "rmd" }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "html", "markdown", "markdown_inline" })
      end
    end,
  },
  opts = {
    hybrid_modes = { "n" },
    headings = { shift_width = 0 },
  },
}
