return {
  "vyfor/cord.nvim",
  build = "./build",
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
