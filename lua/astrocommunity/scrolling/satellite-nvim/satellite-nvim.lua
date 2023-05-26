return {
  { -- scrollbar
    "lewis6991/satellite.nvim",
    event = "User AstroFile",
    opts = { excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" } },
  },
  {
    "folke/zen-mode.nvim",
    optional = true,
    opts = function(_, opts)
      local old_on_open, old_on_close = opts.on_open, opts.on_close
      opts.on_open = function()
        old_on_open()
        vim.cmd.SatelliteDisable()
      end
      opts.on_close = function()
        old_on_close()
        vim.cmd.SatelliteEnable()
      end
    end,
  },
}
