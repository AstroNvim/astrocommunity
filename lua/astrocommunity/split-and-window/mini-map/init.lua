return {
  "echasnovski/mini.map",
  version = "*",
  keys = {
    { "<leader>um", function() require("mini.map").toggle() end, desc = "Toggle minimap" },
  },
  opts = function()
    local map = require "mini.map"
    return {
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.gitsigns(),
        map.gen_integration.diagnostic {
          error = "DiagnosticFloatingError",
          warn = "DiagnosticFloatingWarn",
          info = "DiagnosticFloatingInfo",
          hint = "DiagnosticFloatingHint",
        },
      },
      symbols = {
        encode = map.gen_encode_symbols.dot "3x2",
      },
      window = {
        side = "right",
        width = 22,
        winblend = 5,
        show_integration_count = true,
      },
    }
  end,
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },
}
