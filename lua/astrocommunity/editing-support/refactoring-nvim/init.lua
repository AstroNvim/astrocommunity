return {
  "ThePrimeagen/refactoring.nvim",
  event = "User AstroFile",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
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
                function() require("refactoring").refactor "Extract Block" end,
                desc = "Extract Block",
              },
              ["<Leader>ri"] = {
                function() require("refactoring").refactor "Inline Variable" end,
                desc = "Inline Variable",
              },
              ["<Leader>rp"] = {
                function() require("refactoring").debug.printf { below = false } end,
                desc = "Debug: Print Function",
              },
              ["<Leader>rc"] = {
                function() require("refactoring").debug.cleanup {} end,
                desc = "Debug: Clean Up",
              },
              ["<Leader>rd"] = {
                function() require("refactoring").debug.print_var { below = false } end,
                desc = "Debug: Print Variable",
              },
              ["<Leader>rbf"] = {
                function() require("refactoring").refactor "Extract Block To File" end,
                desc = "Extract Block To File",
              },
            },
            x = {
              ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
              ["<Leader>re"] = {
                function() require("refactoring").refactor "Extract Function" end,
                desc = "Extract Function",
              },
              ["<Leader>rf"] = {
                function() require("refactoring").refactor "Extract Function To File" end,
                desc = "Extract Function To File",
              },
              ["<Leader>rv"] = {
                function() require("refactoring").refactor "Extract Variable" end,
                desc = "Extract Variable",
              },
              ["<Leader>ri"] = {
                function() require("refactoring").refactor "Inline Variable" end,
                desc = "Inline Variable",
              },
            },
            v = {
              ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
              ["<Leader>re"] = {
                function() require("refactoring").refactor "Extract Function" end,
                desc = "Extract Function",
              },
              ["<Leader>rf"] = {
                function() require("refactoring").refactor "Extract Function To File" end,
                desc = "Extract Function To File",
              },
              ["<Leader>rv"] = {
                function() require("refactoring").refactor "Extract Variable" end,
                desc = "Extract Variable",
              },
              ["<Leader>ri"] = {
                function() require("refactoring").refactor "Inline Variable" end,
                desc = "Inline Variable",
              },
              ["<Leader>rb"] = {
                function() require("refactoring").refactor "Extract Block" end,
                desc = "Extract Block",
              },
              ["<Leader>rbf"] = {
                function() require("refactoring").refactor "Extract Block To File" end,
                desc = "Extract Block To File",
              },
              ["<Leader>rr"] = {
                function() require("refactoring").select_refactor() end,
                desc = "Select Refactor",
              },
              ["<Leader>rp"] = {
                function() require("refactoring").debug.printf { below = false } end,
                desc = "Debug: Print Function",
              },
              ["<Leader>rc"] = {
                function() require("refactoring").debug.cleanup {} end,
                desc = "Debug: Clean Up",
              },
              ["<Leader>rd"] = {
                function() require("refactoring").debug.print_var { below = false } end,
                desc = "Debug: Print Variable",
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
