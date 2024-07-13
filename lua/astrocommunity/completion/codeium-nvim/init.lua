return {
  "Exafunction/codeium.nvim",
  event = "User AstroFile",
  cmd = "Codeium",
  opts = {
    enable_chat = true,
  },
  dependencies = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          Codeium = "",
        },
      },
    },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        return require("astrocore").extend_tbl(opts, {
          mappings = {
            n = {
              ["<Leader>;"] = {
                desc = require("astroui").get_icon("Codeium", 1, true) .. "Codeium",
              },
              ["<Leader>;o"] = {
                desc = "Open Chat",
                function() vim.cmd "Codeium Chat" end,
              },
            },
          },
        })
      end,
    },
  },
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
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
      opts = function(_, opts)
        if not opts.symbol_map then opts.symbol_map = {} end
        opts.symbol_map.Codeium = require("astroui").get_icon("Codeium", 1, true)
      end,
    },
  },
}
