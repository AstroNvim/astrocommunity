return {
  "ThePrimeagen/refactoring.nvim",
  event = "User AstroFile",
  dependencies = {
    "lewis6991/async.nvim",
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local get_icon = require("astroui").get_icon
        return require("astrocore").extend_tbl(opts, {
          mappings = {
            n = {
              ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
              ["<Leader>rb"] = {
                function() return require("refactoring").extract_func() end,
                desc = "Extract Function",
                expr = true,
              },
              ["<Leader>ri"] = {
                function() return require("refactoring").inline_var() end,
                desc = "Inline Variable",
                expr = true,
              },
              ["<Leader>rp"] = {
                function() return require("refactoring.debug").print_loc { output_location = "above" } end,
                desc = "Debug: Print Location",
                expr = true,
              },
              ["<Leader>rc"] = {
                function() return require("refactoring.debug").cleanup { restore_view = true } end,
                desc = "Debug: Clean Up",
                expr = true,
                remap = true,
              },
              ["<Leader>rd"] = {
                function() return require("refactoring.debug").print_var { output_location = "above" } end,
                desc = "Debug: Print Variable",
                expr = true,
                remap = true,
              },
              ["<Leader>rbf"] = {
                function() return require("refactoring").extract_func_to_file() end,
                desc = "Extract Function To File",
                expr = true,
              },
            },
            x = {
              ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
              ["<Leader>re"] = {
                function() return require("refactoring").extract_func() end,
                desc = "Extract Function",
                expr = true,
              },
              ["<Leader>rf"] = {
                function() return require("refactoring").extract_func_to_file() end,
                desc = "Extract Function To File",
                expr = true,
              },
              ["<Leader>rv"] = {
                function() return require("refactoring").extract_var() end,
                desc = "Extract Variable",
                expr = true,
              },
              ["<Leader>ri"] = {
                function() return require("refactoring").inline_var() end,
                desc = "Inline Variable",
                expr = true,
              },
            },
            v = {
              ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
              ["<Leader>re"] = {
                function() return require("refactoring").extract_func() end,
                desc = "Extract Function",
                expr = true,
              },
              ["<Leader>rf"] = {
                function() return require("refactoring").extract_func_to_file() end,
                desc = "Extract Function To File",
                expr = true,
              },
              ["<Leader>rv"] = {
                function() return require("refactoring").extract_var() end,
                desc = "Extract Variable",
                expr = true,
              },
              ["<Leader>ri"] = {
                function() return require("refactoring").inline_var() end,
                desc = "Inline Variable",
                expr = true,
              },
              ["<Leader>rb"] = {
                function() return require("refactoring").extract_func() end,
                desc = "Extract Function",
                expr = true,
              },
              ["<Leader>rbf"] = {
                function() return require("refactoring").extract_func_to_file() end,
                desc = "Extract Function To File",
                expr = true,
              },
              ["<Leader>rr"] = {
                function() require("refactoring").select_refactor() end,
                desc = "Select Refactor",
              },
              ["<Leader>rp"] = {
                function() return require("refactoring.debug").print_exp { output_location = "above" } end,
                desc = "Debug: Print Expression",
                expr = true,
              },
              ["<Leader>rc"] = {
                function() return require("refactoring.debug").cleanup { restore_view = true } end,
                desc = "Debug: Clean Up",
                expr = true,
                remap = true,
              },
              ["<Leader>rd"] = {
                function() return require("refactoring.debug").print_var { output_location = "above" } end,
                desc = "Debug: Print Variable",
                expr = true,
              },
            },
          },
        } --[[@as AstroCoreOpts]])
      end,
    },
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          Refactoring = "󰣪",
        },
      },
    },
  },
  opts = {},
}
