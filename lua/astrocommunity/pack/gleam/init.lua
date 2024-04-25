return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "gleam" })
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = function(_, opts)
      if vim.fn.executable "gleam" == 1 then
        opts.servers = require("astrocore").list_insert_unique(opts.servers, { "gleam" })
      end
    end,
  },
}
