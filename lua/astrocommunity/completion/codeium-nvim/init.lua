return {
  "Exafunction/codeium.nvim",
  event = "User AstroFile",
  cmd = "Codeium",
  opts = {
    enable_chat = true,
    virtual_text = { key_bindings = { accept = false } },
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
          options = {
            g = {
              -- set the ai_accept function
              ai_accept = function()
                if require("codeium.virtual_text").get_current_completion_item() then
                  vim.api.nvim_input(require("codeium.virtual_text").accept())
                  return true
                end
              end,
            },
          },
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
    { import = "astrocommunity.recipes.ai" },
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
