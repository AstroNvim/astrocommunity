local utils = require "astronvim.utils"
return {
  "Pocco81/true-zen.nvim",
  opts = function(_, opts)
    return utils.extend_tbl(opts, {
      integrations = {
        tmux = os.getenv "TMUX" ~= nil, -- hide tmux status bar in (minimalist, ataraxis)
        twilight = utils.is_available "twilight.nvim", -- enable twilight (ataraxis)
      },
    })
  end,
  keys = {
    {
      "<leader>zf",
      function() require("true-zen").focus() end,
      desc = "Focus (True Zen)",
    },
    {
      "<leader>zm",
      function() require("true-zen").minimalist() end,
      desc = "Minimalist (True Zen)",
    },
    {
      "<leader>za",
      function() require("true-zen").ataraxis() end,
      desc = "Ataraxis (True Zen)",
    },
    {
      "<leader>zn",
      function()
        local truezen = require "true-zen"
        local first = 0
        local last = vim.api.nvim_buf_line_count(0)
        truezen.narrow(first, last)
      end,
      desc = "Narrow (True Zen)",
    },
    {
      "<leader>zn",
      function()
        local truezen = require "true-zen"
        local first = vim.fn.line "v"
        local last = vim.fn.line "."
        truezen.narrow(first, last)
      end,
      desc = "Narrow (True Zen)",
      mode = { "v" },
    },
  },
}
