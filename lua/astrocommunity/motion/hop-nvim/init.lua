return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["s"] = {
            function() require("hop").hint_words() end,
            desc = "Hop hint words",
          },
          ["<S-s>"] = {
            function() require("hop").hint_lines() end,
            desc = "Hop hint lines",
          },
        },
        v = {
          ["s"] = {
            function() require("hop").hint_words { extend_visual = true } end,
            desc = "Hop hint words",
          },
          ["<S-s>"] = {
            function() require("hop").hint_lines { extend_visual = true } end,
            desc = "Hop hint lines",
          },
        },
      },
    },
  },
  {
    "phaazon/hop.nvim",
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { hop = true } },
  },
}
