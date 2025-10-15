return {
  "nvim-mini/mini.hipatterns",
  event = "User AstroFile",
  opts = {},
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },
}
