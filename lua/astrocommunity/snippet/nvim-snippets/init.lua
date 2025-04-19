return {
  "garymjr/nvim-snippets",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = { friendly_snippets = true },
  lazy = true,
  specs = {
    { "L3MON4D3/LuaSnip", optional = true, enabled = false },
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "garymjr/nvim-snippets" },
      opts = function(_, opts)
        if not opts.sources then opts.sources = {} end
        table.insert(opts.sources, { name = "snippets", priority = 750 })
      end,
    },
  },
}
