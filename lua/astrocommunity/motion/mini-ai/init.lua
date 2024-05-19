return {
  {
    "echasnovski/mini.ai",
    event = "User AstroFile",
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
