local utils = require "astronvim.utils"

return {
  {
    "quarto-dev/quarto-nvim",
    opts = {},
    dependencies = {
      { "hrsh7th/nvim-cmp" },
      {
        "jmbuhr/otter.nvim",
        dev = false,
        opts = {
          lsp = {
            hover = {
              border = require("misc.style").border,
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local ensure_installed = {
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
      }
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, ensure_installed)
      end
    end,
  },
}
