return {
  { "L3MON4D3/LuaSnip", enabled = false },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "garymjr/nvim-snippets",
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = { friendly_snippets = true },
      },
    },
    opts = function(_, opts)
      if not opts.sources then opts.sources = {} end
      table.insert(opts.sources, { name = "snippets", priority = 750 })
    end,
  },
}
