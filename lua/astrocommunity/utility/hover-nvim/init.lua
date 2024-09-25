return {
  "lewis6991/hover.nvim",
  lazy = true,
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = { opt = { mousemoveevent = true } },
        mappings = {
          n = {
            K = { function() require("hover").hover() end, desc = "Hover cursor" },
            gK = { function() require("hover").hover_select() end, desc = "Hover selection" },
            ["]h"] = { function() require("hover").hover_switch "next" end, desc = "Next hover source" },
            ["[h"] = { function() require("hover").hover_switch "previous" end, desc = "Previous hover source" },
            ["<MouseMove>"] = { function() require("hover").hover_mouse() end, desc = "Hover mouse" },
          },
        },
      },
    },
    {
      "AstroNvim/astrolsp",
      opts = { mappings = { n = { K = false } } },
    },
  },
  opts = {
    init = function() require "hover.providers.lsp" end,
  },
}
