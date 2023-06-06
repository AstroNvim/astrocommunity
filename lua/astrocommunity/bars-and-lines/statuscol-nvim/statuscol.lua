return {
  { "luukvbaal/statuscol.nvim", lazy = false, opts = {} },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.statuscolumn = nil end,
  },
}
