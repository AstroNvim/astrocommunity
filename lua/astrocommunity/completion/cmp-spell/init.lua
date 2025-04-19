return {
  "f3fora/cmp-spell",
  lazy = true,
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "f3fora/cmp-spell", lazy = true },
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, { name = "spell" })
      end,
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      dependencies = "f3fora/cmp-spell",
      specs = { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
      opts = {
        sources = {
          default = { "spell" },
          providers = {
            spell = { name = "spell", module = "blink.compat.source" },
          },
        },
      },
    },
  },
}
