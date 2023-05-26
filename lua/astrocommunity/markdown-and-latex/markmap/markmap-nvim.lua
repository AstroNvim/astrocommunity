--  [markdown markmap]
--  https://github.com/Zeioth/markmap.nvim
return {
  "Zeioth/markmap.nvim",
  build = "yarn global add markmap-cli",
  cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
  opts = {
    hide_toolbar = "false",
  },
  config = function(_, opts) require("markmap").setup(opts) end,
}
