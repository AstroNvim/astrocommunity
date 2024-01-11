return {
  {
    "echasnovski/mini.ai",
    event = "User AstroFile",
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
