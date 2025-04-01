return {
  "saghen/blink.cmp",
  dependencies = { "mgalliou/blink-cmp-tmux" },
  opts = function(_, opts)
    opts.sources = vim.tbl_deep_extend("keep", opts.sources or {}, {
      default = {},
      providers = {
        tmux = {
          module = "blink-cmp-tmux",
          name = "tmux",
        },
      },
    })
    table.insert(opts.sources.default, "tmux")
  end,
}
