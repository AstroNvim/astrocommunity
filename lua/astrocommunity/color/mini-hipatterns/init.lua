return {
  {
    "echasnovski/mini.hipatterns",
    event = "User AstroFile",
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    name = "catppuccin",
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
