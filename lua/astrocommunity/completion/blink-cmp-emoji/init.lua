return {
  "moyiz/blink-emoji.nvim",
  lazy = true,
  specs = {
    "Saghen/blink.cmp",
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
