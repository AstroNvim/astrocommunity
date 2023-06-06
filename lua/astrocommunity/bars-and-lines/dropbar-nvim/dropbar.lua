return {
  { "Bekaboo/dropbar.nvim", event = "VeryLazy", opts = {} },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.winbar = nil end,
  },
}
