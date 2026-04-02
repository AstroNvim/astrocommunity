return {
  "mgalliou/blink-cmp-tmux",
  lazy = true,
  specs = {
    {
      "saghen/blink.cmp",
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
