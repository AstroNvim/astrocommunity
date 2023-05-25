local utils = require "astronvim.utils"
return {
  "Pocco81/true-zen.nvim",
  opts = {
    integrations = {
      tmux = os.getenv "TMUX" ~= nil, -- hide tmux status bar in (minimalist, ataraxis)
      twilight = utils.is_available "twilight.nvim", -- enable twilight (ataraxis)
    },
  },
  keys = {
    { "<leader>zf", require("true-zen").focus },
    { "<leader>zm", require("true-zen").minimalist },
    { "<leader>za", require("true-zen").ataraxis },
    {
      "<leader>zn",
      function()
        local truezen = require "true-zen"
        local first = 0
        local last = vim.api.nvim_buf_line_count(0)
        truezen.narrow(first, last)
      end,
    },
    {
      "<leader>zn",
      function()
        local truezen = require "true-zen"
        local first = vim.fn.line "v"
        local last = vim.fn.line "."
        truezen.narrow(first, last)
      end,
      mode = { "v" },
    },
  },
}
