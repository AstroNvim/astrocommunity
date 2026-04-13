return {
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "gleam" } },
    },
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
