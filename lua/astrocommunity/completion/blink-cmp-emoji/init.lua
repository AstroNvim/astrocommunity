return {
  "moyiz/blink-emoji.nvim",
  lazy = true,
  specs = {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        default = { "emoji" },
        providers = {
          emoji = { name = "emoji", module = "blink-emoji" },
        },
      },
    },
  },
}
