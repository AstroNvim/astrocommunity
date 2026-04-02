return {
  "OXY2DEV/markview.nvim",
  ft = function()
    local plugin = require("lazy.core.config").spec.plugins["markview.nvim"]
    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
    return opts.filetypes or { "markdown", "quarto", "rmd" }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  specs = {
    {
      "AstroNvim/astrocore",
      optional = true,
      ---@type AstroCoreOpts
      opts = {
        treesitter = { ensure_installed = { "html", "markdown", "markdown_inline" } },
      },
    },
  },
  opts = {
    preview = {
      hybrid_modes = { "n" },
      headings = { shift_width = 0 },
    },
  },
}
