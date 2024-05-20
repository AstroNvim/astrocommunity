return {
  {
    "RRethy/vim-illuminate",
    event = "User AstroFile",
    opts = {},
    config = function(_, opts) require("illuminate").configure(opts) end,
  },
  {
    "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { illuminate = true } },
  },
}
