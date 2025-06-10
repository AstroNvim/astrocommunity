return {
  "famiu/feline.nvim",
  event = "VeryLazy",
  opts = {},
  specs = {
    {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts) opts.statusline = nil end,
    },
  },
}
