return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
      init = function()
        require("astrocore").notify(
          "`nvim-ts-rainbow2` is deprecated!\nPlease use `rainbow-delimiters`",
          vim.log.levels.WARN
        )
      end,
    },
    opts = { rainbow = { enable = true } },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { ts_rainbow2 = true } },
  },
}
