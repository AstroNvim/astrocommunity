return {
  "hrsh7th/cmp-nvim-lua",
  lazy = true,
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "hrsh7th/cmp-nvim-lua", lazy = true },
      opts = function(_, opts)
        if not opts.sources then opts.sources = {} end
        table.insert(opts.sources, { name = "nvim_lua" })
      end,
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      dependencies = "hrsh7th/cmp-nvim-lua",
      specs = { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
      opts = {
        sources = {
          default = { "nvim_lua" },
          providers = {
            nvim_lua = { name = "nvim_lua", module = "blink.compat.source" },
          },
        },
      },
    },
  },
}
