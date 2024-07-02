return {
  "hrsh7th/nvim-cmp",
  optional = true,
  dependencies = { "chrisgrieser/cmp-nerdfont" },
  opts = function(_, opts)
    if not opts.sources then opts.sources = {} end
    table.insert(opts.sources, { name = "nerdfont", priority = 700 })
  end,
}
