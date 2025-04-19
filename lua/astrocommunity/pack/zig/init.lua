return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "zig" })
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "lawrence-laz/neotest-zig", version = "^1", config = function() end },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-zig"(require("astrocore").plugin_opts "neotest-zig"))
    end,
  },
  {
    "https://codeberg.org/NTBBloodbath/zig-tools.nvim",
    -- Load zig-tools.nvim only in Zig buffers
    ft = { "zig" },
    opts = {},
    dependencies = {
      "akinsho/toggleterm.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      servers = { "zls" },
    },
  },
}
