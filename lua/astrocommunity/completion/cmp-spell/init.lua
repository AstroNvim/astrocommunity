return {
  "hrsh7th/nvim-cmp",
  optional = true,
  dependencies = { "f3fora/cmp-spell", lazy = true },
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, { name = "spell" })
  end,
}
