---@type LazySpec
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  specs = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = { icons = { GrugFar = "󰛔" } },
    },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
        local maps, prefix = opts.mappings, "<Leader>r"

        maps.n[prefix] = {
          function() require("grug-far").grug_far { transient = true } end,
          desc = require("astroui").get_icon("GrugFar", 1, true) .. "Search and Replace",
        }

        maps.x[prefix] = {
          function() require("grug-far").grug_far { transient = true, startCursorRow = 4 } end,
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
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { grug_far = true } },
    },
  },
  ---@param opts GrugFarOptionsOverride
  opts = function(_, opts)
    if not opts.icons then opts.icons = {} end
    opts.icons.enabled = vim.g.icons_enabled
    if not vim.g.icons_enabled then
      opts.resultsSeparatorLineChar = "-"
      opts.spinnerStates = {
        "|",
        "\\",
        "-",
        "/",
      }
    end
  end,
}
