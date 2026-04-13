return {
  "Kaiser-Yang/blink-cmp-git",
  lazy = true,
  specs = {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        default = { "git" },
        providers = {
          git = {
            module = "blink-cmp-git",
            name = "Git",
          },
        },
      },
    },
  },
}
