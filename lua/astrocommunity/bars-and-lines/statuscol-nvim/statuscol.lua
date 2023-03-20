return {
  { "luukvbaal/statuscol.nvim", lazy = false, opts = {} },
  {
    "rebelot/heirline.nvim",
    opts = function(opts) opts.statuscolumn = nil end,
  },
}
