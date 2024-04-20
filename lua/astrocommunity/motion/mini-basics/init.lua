return {
  {
    "echasnovski/mini.basics",
    version = false,
    event = "User AstroFile",
    opts = {
      mappings = {
        windows = true,
        move_with_alt = true,
      },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    name = "catppuccin",
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
