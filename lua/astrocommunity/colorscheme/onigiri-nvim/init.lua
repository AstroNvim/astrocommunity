return {
  "kaiuri/onigiri.nvim",
  init = function()
    require("astrocore").notify("`onigiri.nvim` has been archived and is now read only!", vim.log.levels.WARN)
  end,
}
