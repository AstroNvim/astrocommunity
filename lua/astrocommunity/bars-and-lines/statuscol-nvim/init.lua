return {
  {
    "luukvbaal/statuscol.nvim",
    event = "User AstroFile",
    lazy = vim.fn.argv()[1] == nil,
    opts = {},
  },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.statuscolumn = nil end,
  },
}
