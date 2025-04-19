return {
  "smoka7/hop.nvim",
  opts = {},
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["s"] = { function() require("hop").hint_words() end, desc = "Hop hint words" },
          ["<S-s>"] = { function() require("hop").hint_lines() end, desc = "Hop hint lines" },
        },
        v = {
          ["s"] = { function() require("hop").hint_words { extend_visual = true } end, desc = "Hop hint words" },
          ["<S-s>"] = {
            function() require("hop").hint_lines { extend_visual = true } end,
            desc = "Hop hint lines",
          },
        },
      },
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { hop = true } },
    },
  },
}
