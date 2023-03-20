return {
  { "nvim-lualine/lualine.nvim", event = "VeryLazy", opts = {} },
  {
    "rebelot/heirline.nvim",
    opts = function(opts) opts.statusline = nil end,
  },
}
