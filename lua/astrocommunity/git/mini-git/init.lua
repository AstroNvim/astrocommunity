---@type LazySpec
return {
  "echasnovski/mini-git",
  main = "mini.git",
  event = "User AstroGitFile",
  cmd = "Git",
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
