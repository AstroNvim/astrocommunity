return {
  { "akinsho/bufferline.nvim", event = "VeryLazy", opts = {} },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.tabline = nil end,
  },
}
