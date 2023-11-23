return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>rb"] = { require("refactoring").refactor "Extract Block", desc = "Extract Block" },
            ["<Leader>ri"] = { require("refactoring").refactor "Inline Variable", desc = "Inline Variable" },
            ["<Leader>rp"] = { require("refactoring").debug.printf { below = false }, desc = "Debug: Print Function" },
            ["<Leader>rc"] = { require("refactoring").debug.cleanup {}, desc = "Debug: Clean Up" },
            ["<Leader>rd"] = {
              require("refactoring").debug.print_var { below = false },
              desc = "Debug: Print Variable",
            },
            ["<Leader>rbf"] = {
              require("refactoring").refactor "Extract Block To File",
              desc = "Extract Block To File",
            },
          },
          x = {
            ["<Leader>re"] = {
              function() require("refactoring").refactor "Extract Function" end,
              desc = "Extract Function",
            },
            ["<Leader>rf"] = {
              function() require("refactoring").refactor "Extract Function To File" end,
              desc = "Extract Function To File",
            },
            ["<leadeer>rv"] = { require("refactoring").refactor "Extract Variable", desc = "Extract Variable" },
            ["<Leader>ri"] = { require("refactoring").refactor "Inline Variable", desc = "Inline Variable" },
          },
          v = {
            ["<Leader>re"] = {
              function() require("refactoring").refactor "Extract Function" end,
              desc = "Extract Function",
            },
            ["<Leader>rf"] = {
              function() require("refactoring").refactor "Extract Function To File" end,
              desc = "Extract Function To File",
            },
            ["<leadeer>rv"] = { require("refactoring").refactor "Extract Variable", desc = "Extract Variable" },
            ["<Leader>ri"] = { require("refactoring").refactor "Inline Variable", desc = "Inline Variable" },
            ["<Leader>rb"] = { require("refactoring").refactor "Extract Block", desc = "Extract Block" },
            ["<Leader>rbf"] = {
              require("refactoring").refactor "Extract Block To File",
              desc = "Extract Block To File",
            },
            ["<Leader>rr"] = { require("refactoring").select_refactor, desc = "Select Refactor" },
            ["<Leader>rp"] = { require("refactoring").debug.printf { below = false }, desc = "Debug: Print Function" },
            ["<Leader>rc"] = { require("refactoring").debug.cleanup {}, desc = "Debug: Clean Up" },
            ["<Leader>rd"] = {
              require("refactoring").debug.print_var { below = false },
              desc = "Debug: Print Variable",
            },
          },
        },
      },
    },
  },
  opts = {},
}
