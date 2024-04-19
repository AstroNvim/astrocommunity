return {
  "vyfor/cord.nvim",
  build = "./build",
  event = "VeryLazy",
  opts = {
    editor = {
      -- TODO: replace with `client = "astronvim"` after PR merged upstream
      --       https://github.com/vyfor/cord.nvim/pull/22
      image = "https://astronvim.com/logo/astronvim.png",
      client = "1009122352916857003",
      tooltip = "An aesthetically pleasing and feature-rich Neovim configuration",
    },
    buttons = {
      { label = "View Repository", url = "git" },
      { label = "View AstroNvim", url = "https://astronvim.com" },
    },
  },
}
