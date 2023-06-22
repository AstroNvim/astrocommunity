return {
  "echasnovski/mini.move",
  keys = {
    { "<A-h>", mode = "n", desc = "Move line left" },
    { "<A-j>", mode = "n", desc = "Move line down" },
    { "<A-k>", mode = "n", desc = "Move line up" },
    { "<A-l>", mode = "n", desc = "Move line right" },
    { "<A-h>", mode = "v", desc = "Move selection left" },
    { "<A-j>", mode = "v", desc = "Move selection down" },
    { "<A-k>", mode = "v", desc = "Move selection up" },
    { "<A-l>", mode = "v", desc = "Move selection right" },
  },
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
}
