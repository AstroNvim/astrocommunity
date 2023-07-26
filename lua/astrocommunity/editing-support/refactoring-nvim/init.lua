return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>rb"] = {
            require("refactoring").refactor "Extract Block",
            desc = "Extract Block",
          },
          ["<leader>ri"] = {
            require("refactoring").refactor "Inline Variable",
            desc = "Inline Variable",
          },
          ["<leader>rp"] = {
            require("refactoring").debug.printf { below = false },
            desc = "Debug: Print Function",
          },
          ["<leader>rc"] = {
            require("refactoring").debug.cleanup {},
            desc = "Debug: Clean Up",
          },
          ["<leader>rd"] = {
            require("refactoring").debug.print_var { below = false },
            desc = "Debug: Print Variable",
          },
          ["<leader>rbf"] = {
            require("refactoring").refactor "Extract Block To File",
            desc = "Extract Block To File",
          },
        },
        x = {
          ["<leader>re"] = {
            function() require("refactoring").refactor "Extract Function" end,
            desc = "Extract Function",
          },
          ["<leader>rf"] = {
            function() require("refactoring").refactor "Extract Function To File" end,
            desc = "Extract Function To File",
          },
          ["<leadeer>rv"] = {
            require("refactoring").refactor "Extract Variable",
            desc = "Extract Variable",
          },
          ["<leader>ri"] = {
            require("refactoring").refactor "Inline Variable",
            desc = "Inline Variable",
          },
        },
        v = {
          ["<leader>re"] = {
            function() require("refactoring").refactor "Extract Function" end,
            desc = "Extract Function",
          },
          ["<leader>rf"] = {
            function() require("refactoring").refactor "Extract Function To File" end,
            desc = "Extract Function To File",
          },
          ["<leadeer>rv"] = {
            require("refactoring").refactor "Extract Variable",
            desc = "Extract Variable",
          },
          ["<leader>ri"] = {
            require("refactoring").refactor "Inline Variable",
            desc = "Inline Variable",
          },
          ["<leader>rb"] = {
            require("refactoring").refactor "Extract Block",
            desc = "Extract Block",
          },
          ["<leader>rbf"] = {
            require("refactoring").refactor "Extract Block To File",
            desc = "Extract Block To File",
          },
          ["<leader>rr"] = {
            require("refactoring").select_refactor,
            desc = "Select Refactor",
          },
          ["<leader>rp"] = {
            require("refactoring").debug.printf { below = false },
            desc = "Debug: Print Function",
          },
          ["<leader>rc"] = {
            require("refactoring").debug.cleanup {},
            desc = "Debug: Clean Up",
          },
          ["<leader>rd"] = {
            require("refactoring").debug.print_var { below = false },
            desc = "Debug: Print Variable",
          },
        },
      },
    },
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
}
