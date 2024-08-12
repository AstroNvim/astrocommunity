return {
  "isakbm/gitgraph.nvim",
  lazy = true,
  opts = {},
  specs = {
    { -- mapping to open GitGraph
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>g|"] = {
              function() require("gitgraph").draw({}, { all = true, max_count = 5000 }) end,
              desc = "GitGraph",
            },
          },
        },
      },
    },
    { -- use diffview for viewing commits if available
      "sindrets/diffview.nvim",
      optional = true,
      specs = {
        {
          "isakbm/gitgraph.nvim",
          opts = {
            hooks = {
              on_select_commit = function(commit) vim.cmd.DiffviewOpen(commit.hash .. "^!") end,
              on_select_range_commit = function(from, to) vim.cmd.DiffviewOpen(from.hash .. "~1.." .. to.hash) end,
            },
          },
        },
      },
    },
  },
}
