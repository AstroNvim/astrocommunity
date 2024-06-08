---@type LazySpec
return {
  {
    "Exafunction/codeium.nvim",
    opts = {
      enable_chat = true,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "Exafunction/codeium.nvim" },
    opts = function(_, opts)
      -- Inject codeium into cmp sources, with high priority
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 10000,
      })
    end,
  },
  {
    "onsails/lspkind.nvim",
    optional = true,
    -- Adds icon for codeium using lspkind
    opts = function(_, opts) opts.symbol_map = { Codeium = "" } end,
  },
}
