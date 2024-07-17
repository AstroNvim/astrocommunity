---@type LazySpec
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  specs = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          GrugFar = "󰛔",
        },
      },
    },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = opts.mappings and opts.mappings or require("astrocore").empty_map_table()
        local prefix = "<Leader>r"

        maps.n[prefix] = {
          function() require("grug-far").grug_far {} end,
          desc = require("astroui").get_icon("GrugFar", 1, true) .. "Search and Replace",
        }

        maps.x[prefix] = {
          function() require("grug-far").with_visual_selection {} end,
          desc = require("astroui").get_icon("GrugFar", 1, true) .. "Search and Replace (current word)",
        }
      end,
    },
    {
      "zbirenbaum/copilot.lua",
      optional = true,
      opts = {
        filetypes = {
          ["grug-far"] = false,
          ["grug-far-history"] = false,
        },
      },
    },
  },
  ---@param opts GrugFarOptionsOverride
  -- NOTE: Wrapping opts into a function, because `astrocore` can set vim options
  opts = function(_, opts)
    return require("astrocore").extend_tbl(opts, {
      icons = {
        enabled = vim.g.icons_enabled,
      },
    } --[[@as GrugFarOptionsOverride]])
  end,
}
