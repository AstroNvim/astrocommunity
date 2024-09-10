---@type LazySpec
return {
  "zbirenbaum/copilot-cmp",
  event = "User AstroFile",
  opts = {},
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
      },
    },
  },
  specs = {
    { import = "astrocommunity.completion.copilot-lua" },
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "zbirenbaum/copilot-cmp" },
      opts = function(_, opts)
        -- Inject copilot into cmp sources, with high priority
        table.insert(opts.sources, 1, {
          name = "copilot",
          group_index = 1,
          priority = 10000,
        })
      end,
    },
    {
      "onsails/lspkind.nvim",
      optional = true,
      -- Adds icon for copilot using lspkind
      opts = function(_, opts) opts.symbol_map.Copilot = "" end,
    },
  },
}
