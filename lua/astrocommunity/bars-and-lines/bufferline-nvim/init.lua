return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["]b"] = { function() require("bufferline.commands").cycle(vim.v.count1) end, desc = "Next buffer" }
          maps.n["[b"] =
            { function() require("bufferline.commands").cycle(-vim.v.count1) end, desc = "Previous buffer" }
          maps.n[">b"] = {
            function() require("bufferline.commands").move(vim.v.count1) end,
            desc = "Move buffer tab right",
          }
          maps.n["<b"] = {
            function() require("bufferline.commands").move(-vim.v.count1) end,
            desc = "Move buffer tab left",
          }

          for k, _ in pairs(maps.n) do
            if k:find "^<Leader>b" then maps.n[k] = false end
          end
        end,
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
