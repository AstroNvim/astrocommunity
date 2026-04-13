return {
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "nix" } },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local builtins = require("null-ls").builtins
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        builtins.code_actions.statix,
        builtins.diagnostics.deadnix,
      })
    end,
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = function(_, opts) opts.servers = require("astrocore").list_insert_unique(opts.servers, { "nixd" }) end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        nix = { "statix", "deadnix" },
      },
    },
  },
}
