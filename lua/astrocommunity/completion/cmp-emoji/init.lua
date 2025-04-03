return {
  "hrsh7th/cmp-emoji",
  lazy = true,
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "hrsh7th/cmp-emoji" },
      opts = function(_, opts)
        if not opts.sources then opts.sources = {} end
        table.insert(opts.sources, { name = "emoji", priority = 700 })
      end,
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      dependencies = "hrsh7th/cmp-emoji",
      specs = { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
      opts = {
        sources = {
          default = { "emoji" },
          providers = {
            emoji = { name = "emoji", module = "blink.compat.source", score_offset = -1 },
          },
        },
      },
    },
  },
}
