return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  ---@type CatppuccinOptions
  ---@diagnostic disable: missing-fields
  opts = {
    auto_integrations = true,
    integrations = {
      colorful_winsep = { color = "lavender" },
      snacks = {
        indent_scope_color = "lavender",
      },
    },
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        return require("astrocore").extend_tbl(opts, {
          highlights = require("catppuccin.groups.integrations.bufferline").get_theme(),
        })
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
      opts = {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      },
    },
  },
}
