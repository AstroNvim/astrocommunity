return {
  "Exafunction/codeium.nvim",
  event = "User AstroFile",
  cmd = "Codeium",
  opts = function(_, opts)
    opts.enable_chat = true
    opts.enable_cmp_source = require("astrocore").is_available "nvim-cmp"
  end,
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
    {
      "echasnovski/mini.icons",
      optional = true,
      -- Adds icon for codeium using mini.icons
      opts = function(_, opts)
        if not opts.lsp then opts.lsp = {} end
        if not opts.symbol_map then opts.symbol_map = {} end
        opts.symbol_map.codeium = { glyph = require("astroui").get_icon("Codeium", 1, true), hl = "MiniIconsCyan" }
      end,
    },
  },
}
