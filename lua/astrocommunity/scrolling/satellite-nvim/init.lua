return {
  -- scrollbar
  "lewis6991/satellite.nvim",
  event = "User AstroFile",
  opts = { excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" } },
  specs = {
    {
      "folke/zen-mode.nvim",
      optional = true,
      opts = function(_, opts)
        local utils = require "astrocore"
        local old_on_open, old_on_close = opts.on_open, opts.on_close
        opts.on_open = function()
          utils.conditional_func(old_on_open, true)
          vim.cmd.SatelliteDisable()
        end
        opts.on_close = function()
          utils.conditional_func(old_on_close, true)
          vim.cmd.SatelliteEnable()
        end
      end,
    },
  },
}
