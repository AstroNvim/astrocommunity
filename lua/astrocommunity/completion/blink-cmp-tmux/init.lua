return {
  "mgalliou/blink-cmp-tmux",
  lazy = true,
  specs = {
    {
      "Saghen/blink.cmp",
      optional = true,
      opts = {
        sources = {
          default = { "tmux" },
          providers = {
            tmux = { name = "tmux", module = "blink-cmp-tmux" },
          },
        },
      },
    },
  },
}
