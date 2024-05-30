return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["]b"] = { function() require("bufferline.commands").cycle(1) end, desc = "Next buffer" },
              ["[b"] = { function() require("bufferline.commands").cycle(-1) end, desc = "Previous buffer" },
            },
          },
        },
      },
    },
    event = "VeryLazy",
    opts = {
      options = {
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
  },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts) opts.tabline = nil end,
  },
}
