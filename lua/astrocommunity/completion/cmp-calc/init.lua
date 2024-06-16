return {
  "hrsh7th/nvim-cmp",
  optional = true,
  dependencies = { "hrsh7th/cmp-calc", lazy = true },
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, { name = "calc" })
  end,
}
