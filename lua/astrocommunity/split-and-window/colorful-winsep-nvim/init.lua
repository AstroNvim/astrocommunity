return {
  "nvim-zh/colorful-winsep.nvim",
  event = "WinLeave",
  opts = {},
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { colorful_winsep = { enabled = true, color = "red" } } },
    },
  },
}
