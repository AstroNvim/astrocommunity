return {
  { "folke/neodev.nvim", enabled = false },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "astrocore", words = { "AstroCore" } },
        { path = "astrolsp", words = { "AstroLSP" } },
        { path = "astroui", words = { "AstroUI" } },
        { path = "astrotheme", words = { "AstroTheme" } },
        { path = "lazy.nvim", words = { "Lazy" } },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts) table.insert(opts.sources, { name = "lazydev", group_index = 0 }) end,
  },
}
