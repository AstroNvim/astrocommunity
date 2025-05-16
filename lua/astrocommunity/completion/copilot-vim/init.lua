---@type LazySpec
return {
  "github/copilot.vim",
  cmd = "Copilot",
  event = "User AstroFile",
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@module 'catppuccin'
      ---@type CatppuccinOptions
      opts = { integrations = { copilot_vim = true } },
    },
  },
}
