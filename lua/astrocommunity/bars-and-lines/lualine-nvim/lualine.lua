return {
  { "nvim-lualine/lualine.nvim", event = "VeryLazy", opts = {} },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.statusline = nil end,
  },
}
