return {
  "mrjones2014/nvim-ts-rainbow",
  lazy = true,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = {
        "mrjones2014/nvim-ts-rainbow",
        init = function()
          require("astrocore").notify(
            "`nvim-ts-rainbow` is deprecated!\nPlease use `rainbow-delimiters`",
            vim.log.levels.WARN
          )
        end,
      },
    },
    {
      "catppuccin/nvim",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { ts_rainbow = true } },
    },
  },
}
