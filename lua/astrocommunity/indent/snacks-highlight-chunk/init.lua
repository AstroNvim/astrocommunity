return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      enabled = true,
      chunk = {
        enabled = true,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          horizontal = "─",
          vertical = "│",
          arrow = ">",
        },
      },
      animate = {
        enabled = true,
        style = "down",
        duration = {
          step = 20,
          total = 300,
        },
      },
    },
  },
}
