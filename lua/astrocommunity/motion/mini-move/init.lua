return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<A-h>"] = { desc = "Move line left" },
          ["<A-j>"] = { desc = "Move line down" },
          ["<A-k>"] = { desc = "Move line up" },
          ["<A-l>"] = { desc = "Move line right" },
        },
        v = {
          ["<A-h>"] = { desc = "Move selection left" },
          ["<A-j>"] = { desc = "Move selection down" },
          ["<A-k>"] = { desc = "Move selection up" },
          ["<A-l>"] = { desc = "Move selection right" },
        },
      },
    },
  },
  {
    "echasnovski/mini.move",
    opts = {
      mappings = {
        left = "<A-h>",
        right = "<A-l>",
        down = "<A-j>",
        up = "<A-k>",
        line_left = "<A-h>",
        line_right = "<A-l>",
        line_down = "<A-j>",
        line_up = "<A-k>",
      },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { mini = true } },
  },
}
