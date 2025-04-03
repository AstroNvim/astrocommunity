return {
  "hrsh7th/cmp-calc",
  lazy = true,
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "hrsh7th/cmp-calc", lazy = true },
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, { name = "calc" })
      end,
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      dependencies = "hrsh7th/cmp-calc",
      specs = { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
      opts = {
        sources = {
          default = { "calc" },
          providers = {
            calc = { name = "calc", module = "blink.compat.source", score_offset = -1 },
          },
        },
      },
    },
  },
}
