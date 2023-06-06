return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  event = "User AstroFile",
  opts = {},
  keys = {
    {
      "<leader>re",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
      { silent = true, expr = false },
      mode = {
        "v",
      },
      desc = "Extract Function",
    },
    {
      "<leader>rf",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
      { silent = true, expr = false },
      mode = {
        "v",
      },
      desc = "Extract Function To File",
    },
    {
      "<leader>rv",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
      { silent = true, expr = false },
      mode = {
        "v",
      },
      desc = "Extract Variable",
    },
    {
      "<leader>ri",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
      { silent = true, expr = false },
      mode = {
        "v",
      },
      desc = "Inline Variable",
    },
    {
      "<leader>rb",
      function() require("refactoring").refactor "Extract Block" end,
      { silent = true, expr = false },
      mode = {
        "n",
      },
      desc = "Extract Block",
    },
    {
      "<leader>rbf",
      function() require("refactoring").refactor "Extract Block To File" end,
      { silent = true, expr = false },
      mode = {
        "n",
      },
      desc = "Extract Block To File",
    },
    {
      "<leader>ri",
      function() require("refactoring").refactor "Inline Variable" end,
      { silent = true, expr = false },
      mode = { "n" },
      desc = "Inline Variable",
    },
    {
      "<leader>rr",
      function() require("refactoring").select_refactor() end,
      { silent = true, expr = false },
      desc = "Select Refactor",
    },
    {
      "<leader>rp",
      function() require("refactoring").debug.printf { below = false } end,
      mode = { "n" },
      desc = "Debug: Print Function",
    },
    {
      "<leader>rv",
      function() require("refactoring").debug.print_var { normal = true, below = false } end,
      mode = { "n" },
      desc = "Debug: Print Variable",
    },
    {
      "<leader>rv",
      function() require("refactoring").debug.print_var { below = false } end,
      mode = { "v" },
      desc = "Debug: Print Variable",
    },
    {
      "<leader>rc",
      function() require("refactoring").debug.cleanup {} end,
      mode = { "n" },
      desc = "Debug: Clean Up",
    },
  },
}
