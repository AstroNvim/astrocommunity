return {
  "vyfor/cord.nvim",
  version = "^1",
  build = vim.fn.has "win32" == 0 and "./build" or ".\\build",
  event = "VeryLazy",
  opts = {
    editor = {
      client = "astronvim",
      tooltip = "An aesthetically pleasing and feature-rich Neovim configuration",
    },
    buttons = {
      { label = "View Repository", url = "git" },
      { label = "View AstroNvim", url = "https://astronvim.com" },
    },
  },
}
