return {
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "qmd" },
    opts = function(_, opts)
      opts.codeRunner = opts.codeRunner or {}

      local iron_avail, _ = pcall(require, "iron.core")
      if iron_avail then
        opts.codeRunner.default_method = "iron"
        return
      end

      local molten_avail, _ = pcall(require, "molten.health")
      if molten_avail then
        opts.codeRunner.default_method = "molten"
        return
      end
    end,
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
