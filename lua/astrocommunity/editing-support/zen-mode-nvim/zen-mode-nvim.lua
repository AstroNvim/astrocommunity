return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      backdrop = 1,
      width = 0.5,
      height = 0.9,
      options = {
        number = false,
        relativenumber = false,
        foldcolumn = "0",
        list = false,
        showbreak = "NONE",
        signcolumn = "no",
      },
    },
    plugins = {
      options = {
        cmdheight = 1,
        laststatus = 0,
      },
    },
    on_open = function() pcall(vim.cmd.IndentBlanklineDisable) end,
    on_close = function() pcall(vim.cmd.IndentBlanklineEnable) end,
  },
}
