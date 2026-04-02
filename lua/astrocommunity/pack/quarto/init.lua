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
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = {
        ensure_installed = {
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
        },
      },
    },
  },
}
