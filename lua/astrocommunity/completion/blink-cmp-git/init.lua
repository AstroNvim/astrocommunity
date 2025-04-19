return {
  "Kaiser-Yang/blink-cmp-git",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  specs = {
    "Saghen/blink.cmp",
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
