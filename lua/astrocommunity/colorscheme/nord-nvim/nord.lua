return {
  {
    "shaunsingh/nord.nvim",
    init = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end,
  },
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
      return require("astronvim.utils").extend_tbl(opts, {
        highlights = require("nord").bufferline.highlights { italic = true, bold = true },
        options = { separator_style = "thin" },
      })
    end,
  },
}
