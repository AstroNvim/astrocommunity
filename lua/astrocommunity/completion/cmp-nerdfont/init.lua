return {
  "chrisgrieser/cmp-nerdfont",
  lazy = true,
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "chrisgrieser/cmp-nerdfont" },
      opts = function(_, opts)
        if not opts.sources then opts.sources = {} end
        table.insert(opts.sources, { name = "nerdfont", priority = 700 })
      end,
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      dependencies = "chrisgrieser/cmp-nerdfont",
      specs = { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
      opts = {
        sources = {
          default = { "nerdfont" },
          providers = {
            nerdfont = { name = "nerdfont", module = "blink.compat.source", score_offset = -1 },
          },
        },
      },
    },
  },
}
