return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.tabline = nil end,
  },
}
