return {
  "shaunsingh/nord.nvim",
  lazy = true,
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      options = {
        g = {
          nord_contrast = true,
          nord_borders = false,
          nord_disable_background = false,
          nord_italic = false,
          nord_uniform_diff_background = true,
          nord_bold = false,
        },
      },
    },
  },
  specs = {
    {
      "lukas-reineke/headlines.nvim",
      optional = true,
      opts = {
        markdown = {
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
        },
      },
    },
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        return require("astrocore").extend_tbl(opts, {
          highlights = require("nord").bufferline.highlights { italic = true, bold = true },
          options = { separator_style = "thin" },
        })
      end,
    },
  },
}
