return {
  "echasnovski/mini.base16",
  lazy = true,
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },
}
