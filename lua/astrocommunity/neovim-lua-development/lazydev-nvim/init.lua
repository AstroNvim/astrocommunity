return {
  "folke/lazydev.nvim",
  ft = "lua",
  cmd = "LazyDev",
  init = function()
    require("astrocore").notify(
      "`lazydev.nvim` has been included upstream!\nPlease remove from your community plugins.",
      vim.log.levels.WARN
    )
  end,
}
