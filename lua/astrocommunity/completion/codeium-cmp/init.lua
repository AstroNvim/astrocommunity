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
  {
    "AstroNvim/astrocore",
    event = "User AstroFile",
    dependencies = { "Exafunction/codeium.nvim" },

    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        mappings = {
          n = {
            ["<Leader>;"] = {
              name = " Codeium",
            },
            ["<Leader>;o"] = {
              desc = "Open Chat",
              function() vim.cmd "Codeium Chat" end,
            },
            ["<Leader>;a"] = {
              desc = "Auth",
              function() vim.cmd "Codeium Auth" end,
            },
          },
        },
      })
    end,
  },
}
