return {
  { "nvim-lualine/lualine.nvim", event = "VeryLazy", opts = {} },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(opts) opts.statusline = nil end,
  },
}
