return {
  "vyfor/cord.nvim",
  version = "^2",
  event = "VeryLazy",
  opts = {
    editor = {
      client = "astronvim",
      tooltip = "An aesthetically pleasing and feature-rich Neovim configuration",
    },
    buttons = {
      { label = "View Repository", url = function(opts) return opts.repo_url end },
      { label = "View AstroNvim", url = "https://astronvim.com" },
    },
  },
}
