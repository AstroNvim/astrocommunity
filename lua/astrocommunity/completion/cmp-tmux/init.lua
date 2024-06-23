return {
  "hrsh7th/nvim-cmp",
  optional = true,
  dependencies = { "andersevenrud/cmp-tmux", lazy = true },
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, { name = "tmux" })
  end,
}
