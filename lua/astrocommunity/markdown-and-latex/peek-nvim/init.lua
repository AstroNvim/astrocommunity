return {
  "toppair/peek.nvim",
  lazy = true,
  build = "deno task --quiet build:fast",
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      commands = {
        PeekOpen = { function() require("peek").open() end, desc = "Open preview window" },
        PeekClose = { function() require("peek").close() end, desc = "Close preview window" },
      },
    },
  },
  opts = {},
}
