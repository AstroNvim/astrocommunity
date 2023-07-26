local prefix = "<leader>r"
local utils = require "astrocore"

return {
  {
    "rest-nvim/rest.nvim",
    ft = { "http", "json" },
    cmd = {
      "RestNvim",
      "RestNvimPreview",
      "RestNvimLast",
    },
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
      { prefix, desc = "RestNvim" },
      { prefix .. "r", "<Plug>RestNvim", desc = "Run request" },
    },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "http", "json" })
      end
    end,
  },
}
