---@type LazySpec
return {
  "andythigpen/nvim-coverage",
  event = "User AstroFile",
  opts = {
    auto_reload = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "AstroNvim/astroui",
      opts = {
        icons = {
          Tests = "󰗇",
          Coverage = "",
        },
      },
    },
    {
      "AstroNvim/astrocore",
      optional = true,
      opts = function(_, opts)
        local astroui = require "astroui"
        local maps = opts.mappings

        local tests_prefix = "<Leader>T"
        local coverage_prefix = tests_prefix .. "C"

        -- INFO: Compatibility with `neotest` and `vim-test`
        maps.n[tests_prefix] = { desc = astroui.get_icon("Tests", 1, true) .. "Tests" }

        maps.n[coverage_prefix] = { desc = astroui.get_icon("Coverage", 1, true) .. "Coverage" }
        maps.n[coverage_prefix .. "t"] = { function() require("coverage").toggle() end, desc = "Toggle coverage" }
        maps.n[coverage_prefix .. "s"] =
          { function() require("coverage").summary() end, desc = "Show coverage summary" }
        maps.n[coverage_prefix .. "c"] = { function() require("coverage").clear() end, desc = "Clear coverage" }
        maps.n[coverage_prefix .. "l"] = {
          function() require("coverage").load(true) end,
          desc = "Load and show coverage",
        }
      end,
    },
  },
}
