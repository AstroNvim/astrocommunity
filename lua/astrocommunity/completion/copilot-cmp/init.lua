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
      "Saghen/blink.cmp",
      optional = true,
      dependencies = "zbirenbaum/copilot-cmp",
      specs = { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
      opts = {
        sources = {
          default = { "copilot" },
          providers = {
            copilot = { name = "copilot", module = "blink.compat.source" },
          },
        },
      },
    },
    {
      "onsails/lspkind.nvim",
      optional = true,
      -- Adds icon for copilot using lspkind
      opts = function(_, opts)
        if not opts.symbol_map then opts.symbol_map = {} end
        opts.symbol_map.Copilot = ""
      end,
    },
    {
      "echasnovski/mini.icons",
      optional = true,
      -- Adds icon for copilot using mini.icons
      opts = function(_, opts)
        if not opts.lsp then opts.lsp = {} end
        if not opts.symbol_map then opts.symbol_map = {} end
        opts.symbol_map.copilot = { glyph = "", hl = "MiniIconsAzure" }
      end,
    },
  },
}
