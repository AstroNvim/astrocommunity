return {
  "echasnovski/mini.basics",
  version = false,
  event = "User AstroFile",
  opts = {
    mappings = {
      windows = true,
      move_with_alt = true,
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },
}
