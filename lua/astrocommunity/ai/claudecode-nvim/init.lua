return {
  "coder/claudecode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { terminal = { enabled = true } } },
  },
  cmd = {
    "ClaudeCode",
    "ClaudeCodeFocus",
    "ClaudeCodeSelectModel",
    "ClaudeCodeAdd",
    "ClaudeCodeSend",
    "ClaudeCodeTreeAdd",
    "ClaudeCodeStatus",
    "ClaudeCodeStart",
    "ClaudeCodeStop",
    "ClaudeCodeOpen",
    "ClaudeCodeClose",
    "ClaudeCodeDiffAccept",
    "ClaudeCodeDiffDeny",
    "ClaudeCodeCloseAllDiffs",
  },
  opts = {},
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        local prefix = "<Leader>A"
        local icon = require("astroui").get_icon("Claude", 1, true)

        maps.n[prefix] = { desc = icon .. "Claude Code" }
        maps.n[prefix .. "c"] = { "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" }
        maps.n[prefix .. "f"] = { "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" }
        maps.n[prefix .. "r"] = { "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" }
        maps.n[prefix .. "C"] = { "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" }
        maps.n[prefix .. "m"] = { "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" }
        maps.n[prefix .. "b"] = { "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" }
        maps.n[prefix .. "a"] = { "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" }
        maps.n[prefix .. "d"] = { "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" }

        maps.v[prefix] = { desc = icon .. "Claude Code" }
        maps.v[prefix .. "s"] = { "<cmd>ClaudeCodeSend<cr>", desc = "Send selection" }
      end,
    },
    { "AstroNvim/astroui", opts = { icons = { Claude = "" } } },
  },
}
