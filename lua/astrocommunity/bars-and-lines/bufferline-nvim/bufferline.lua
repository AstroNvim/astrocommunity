return {
  { "akinsho/bufferline.nvim", event = "VeryLazy", opts = {} },
  {
    "rebelot/heirline.nvim",
    opts = function(opts) opts.tabline = nil end,
  },
}
