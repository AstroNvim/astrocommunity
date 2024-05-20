return {
  { "Bekaboo/dropbar.nvim", event = "UIEnter", opts = {} },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.winbar = nil end,
  },
  {
    "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { dropbar = { enabled = true } } },
  },
}
