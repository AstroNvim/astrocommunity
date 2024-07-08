return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  opts = {},
  specs = {
    {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts) opts.statuscolumn = nil end,
    },
  },
}
