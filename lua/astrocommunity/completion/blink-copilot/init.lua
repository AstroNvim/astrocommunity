return {
  "fang2hou/blink-copilot",
  lazy = true,
  specs = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "User AstroFile",
      opts = {
        panel = { enabled = false },
        suggestion = { enabled = false },
      },
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      opts = {
        sources = {
          default = { "copilot" },
          providers = {
            copilot = {
              name = "copilot",
              module = "blink-copilot",
              score_offset = 100,
              async = true,
            },
          },
        },
      },
    },
  },
}
