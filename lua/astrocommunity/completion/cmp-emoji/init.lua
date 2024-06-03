return {
  "hrsh7th/nvim-cmp",
  optional = true,
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = function(_, opts)
    if not opts.sources then opts.sources = {} end
    table.insert(opts.sources, { name = "emoji", priority = 700 })
  end,
}
