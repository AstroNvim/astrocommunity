return {
  { "luukvbaal/statuscol.nvim", lazy = false, opts = {} },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(opts) opts.statuscolumn = nil end,
  },
}
