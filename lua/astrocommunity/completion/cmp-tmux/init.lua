return {
  "andersevenrud/cmp-tmux",
  lazy = true,
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "andersevenrud/cmp-tmux", lazy = true },
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, { name = "tmux" })
      end,
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      dependencies = "andersevenrud/cmp-tmux",
      specs = { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
      opts = {
        sources = {
          default = { "tmux" },
          providers = {
            tmux = { name = "tmux", module = "blink.compat.source", score_offset = -1 },
          },
        },
      },
    },
  },
}
