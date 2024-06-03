return {
  { "folke/neodev.nvim", enabled = false },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        uv = "luvit-meta/library",
        lazyvim = "LazyVim",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts) table.insert(opts.sources, { name = "lazydev", group_index = 0 }) end,
  },
}
