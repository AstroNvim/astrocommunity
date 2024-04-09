return {
  "Pocco81/true-zen.nvim",
  lazy = true,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>z"
        maps.n[prefix] = { desc = "True Zen" }
        maps.n[prefix .. "f"] = {
          function() require("true-zen").focus() end,
          desc = "Focus (True Zen)",
        }
        maps.n[prefix .. "m"] = {
          function() require("true-zen").minimalist() end,
          desc = "Minimalist (True Zen)",
        }
        maps.n[prefix .. "a"] = {
          function() require("true-zen").ataraxis() end,
          desc = "Ataraxis (True Zen)",
        }
        maps.n[prefix .. "n"] = {
          function()
            local truezen = require "true-zen"
            local first = 0
            local last = vim.api.nvim_buf_line_count(0)
            truezen.narrow(first, last)
          end,
          desc = "Narrow (True Zen)",
        }

        maps.v[prefix] = maps.n[prefix]
        maps.v[prefix .. "n"] = {
          function()
            local truezen = require "true-zen"
            local first = vim.fn.line "v"
            local last = vim.fn.line "."
            truezen.narrow(first, last)
          end,
          desc = "Narrow (True Zen)",
        }
      end,
    },
  },
  opts = function(_, opts)
    local utils = require "astrocore"
    return utils.extend_tbl(opts, {
      integrations = {
        tmux = os.getenv "TMUX" ~= nil, -- hide tmux status bar in (minimalist, ataraxis)
        twilight = utils.is_available "twilight.nvim", -- enable twilight (ataraxis)
      },
    })
  end,
}
