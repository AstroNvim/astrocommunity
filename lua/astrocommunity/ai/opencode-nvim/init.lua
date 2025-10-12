return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        local prefix = "<Leader>O"
        maps.n[prefix] = { desc = require("astroui").get_icon("OpenCode", 1, true) .. "OpenCode" }
        maps.n[prefix .. "t"] = {
          function() require("opencode").toggle() end,
          desc = "Toggle embedded",
        }
        maps.n[prefix .. "a"] = {
          function() require("opencode").ask "@cursor: " end,
          desc = "Ask about this",
        }
        maps.n[prefix .. "+"] = {
          function() require("opencode").prompt("@buffer", { append = true }) end,
          desc = "Add buffer to prompt",
        }
        maps.n[prefix .. "e"] = {
          function() require("opencode").prompt "Explain @cursor and its context" end,
          desc = "Explain this code",
        }
        maps.n[prefix .. "n"] = {
          function() require("opencode").command "session_new" end,
          desc = "New session",
        }
        maps.n[prefix .. "s"] = {
          function() require("opencode").select() end,
          desc = "Select prompt",
        }
        maps.n["<S-C-u>"] = {
          function() require("opencode").command "messages_half_page_up" end,
          desc = "Messages half page up",
        }
        maps.n["<S-C-d>"] = {
          function() require("opencode").command "messages_half_page_down" end,
          desc = "Messages half page down",
        }

        maps.v[prefix] = { desc = require("astroui").get_icon("OpenCode", 1, true) .. "OpenCode" }
        maps.v[prefix .. "a"] = {
          function() require("opencode").ask "@selection: " end,
          desc = "Ask about selection",
        }
        maps.v[prefix .. "+"] = {
          function() require("opencode").prompt("@selection", { append = true }) end,
          desc = "Add selection to prompt",
        }
        maps.v[prefix .. "s"] = {
          function() require("opencode").select() end,
          desc = "Select prompt",
        }
      end,
    },
    { "AstroNvim/astroui", opts = { icons = { OpenCode = "" } } },
  },
}
