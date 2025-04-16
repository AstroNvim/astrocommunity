return {
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "qmd" },
    opts = {},
    dependencies = {
      { "jmbuhr/otter.nvim" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
          "r",
          "python",
          "markdown",
          "markdown_inline",
          "julia",
          "bash",
          "yaml",
          "lua",
          "vim",
          "query",
          "vimdoc",
          "latex",
          "html",
          "css",
        })
      end
    end,
  },
}
